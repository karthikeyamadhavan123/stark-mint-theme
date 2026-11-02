#!/usr/bin/env bash
# =====================================================================
# Stark-Mint installer for Linux Mint (Cinnamon) and GNOME
#
# Usage:
#   ./install.sh                  copy files, then ASK before changing settings
#   ./install.sh --apply          copy files and apply settings without asking
#   ./install.sh --no-apply       copy files only, never touch desktop settings
#   ./install.sh --uninstall      remove what this installer added (asks before
#                                 restoring your old settings)
#
# Extra options:
#   --no-fonts       don't install the bundled fonts (and don't change fonts)
#   --no-wallpaper   don't copy or set the wallpaper
#   --libadwaita     also theme GTK4/libadwaita apps via ~/.config/gtk-4.0
#   --yes            answer "yes" to questions (same as --apply when installing)
#   -h, --help       show this help
#
# Nothing is deleted. Anything that would be replaced is first moved to
#   ~/.local/share/stark-mint/backups/<date-time>/
# No sudo is needed; everything goes into your home folder.
# =====================================================================

set -euo pipefail
umask 022

NAME="Stark-Mint"
VERSION="1.2.0"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
STATE_DIR="$DATA_HOME/stark-mint"
MANIFEST="$STATE_DIR/manifest.tsv"
RESTORE="$STATE_DIR/restore-settings.sh"
STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$STATE_DIR/backups/$STAMP"

THEMES_DIR="$HOME/.themes"
FONT_DIR="$DATA_HOME/fonts/StarkMint"
ADW_DIR="$CONFIG_HOME/gtk-4.0"
PICTURES_DIR="$HOME/Pictures"
if command -v xdg-user-dir >/dev/null 2>&1; then
  p="$(xdg-user-dir PICTURES 2>/dev/null || true)"
  if [ -n "$p" ] && [ "$p" != "$HOME" ]; then PICTURES_DIR="$p"; fi
fi
WALL_DIR="$PICTURES_DIR/Stark-Mint"
WALL="$WALL_DIR/stark-mint-wallpaper.png"

MODE="install"      # install | uninstall
APPLY="ask"         # ask | yes | no
DO_FONTS=1; DO_WALL=1; DO_ADW=0; ASSUME_YES=0

usage() { sed -n '2,23p' "$0" | sed 's/^# \{0,1\}//'; }

for arg in "$@"; do
  case "$arg" in
    --apply) APPLY="yes" ;;
    --no-apply) APPLY="no" ;;
    --uninstall) MODE="uninstall" ;;
    --no-fonts) DO_FONTS=0 ;;
    --no-wallpaper) DO_WALL=0 ;;
    --libadwaita) DO_ADW=1 ;;
    --yes|-y) ASSUME_YES=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $arg (see --help)" >&2; exit 2 ;;
  esac
done
if [ "$ASSUME_YES" = 1 ] && [ "$APPLY" = "ask" ]; then APPLY="yes"; fi

# ---------- helpers ----------
SUMMARY=()
say()  { printf '\033[38;2;214;168;78m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[38;2;224;90;96m!!\033[0m  %s\n' "$*" >&2; }
note() { SUMMARY+=("$*"); }

# ask "question" -> 0 for yes. Never says yes on its own when not interactive.
ask() {
  if [ "$ASSUME_YES" = 1 ]; then return 0; fi
  if [ ! -t 0 ] || [ ! -t 1 ]; then return 1; fi
  local a
  read -r -p "$1 [y/N] " a || return 1
  [[ "$a" =~ ^[Yy] ]]
}

same() {  # same <a> <b> : true if both exist and have identical contents
  command -v diff >/dev/null 2>&1 || return 1
  [ -e "$1" ] && [ -e "$2" ] && diff -rq -- "$1" "$2" >/dev/null 2>&1
}

backup() {  # backup <path> <label> : move path into this run's backup folder, print new location
  local src="$1" label="$2" dest
  dest="$BACKUP_DIR/$label"
  mkdir -p -- "$(dirname -- "$dest")"
  mv -- "$src" "$dest"
  printf '%s\n' "$dest"
}

declare -A OLD_ORIG=()   # path -> backup of what was there before Stark-Mint was first installed
declare -A OLD_TYPE=()
load_manifest() {
  [ -f "$MANIFEST" ] || return 0
  local type path orig
  while IFS=$'\t' read -r type path orig; do
    [ -n "${path:-}" ] || continue
    OLD_TYPE["$path"]="$type"
    OLD_ORIG["$path"]="${orig:--}"
  done < "$MANIFEST"
}

NEW_MANIFEST=()
# place <type> <source> <destination> <backup-label>
place() {
  local type="$1" src="$2" dest="$3" label="$4" orig="-"
  if [ -n "${OLD_TYPE[$dest]+x}" ]; then
    orig="${OLD_ORIG[$dest]}"                      # we installed this before
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if same "$src" "$dest"; then
      note "unchanged (already up to date): $dest"
      NEW_MANIFEST+=("$type"$'\t'"$dest"$'\t'"$orig")
      return 0
    fi
    local moved
    moved="$(backup "$dest" "$label")"
    if [ -z "${OLD_TYPE[$dest]+x}" ]; then
      orig="$moved"                                # it was yours, not ours: remember it
      note "backed up your existing $dest -> $moved"
    else
      note "backed up previous Stark-Mint copy $dest -> $moved"
    fi
  fi
  mkdir -p -- "$(dirname -- "$dest")"
  cp -R -- "$src" "$dest"
  note "installed: $dest"
  NEW_MANIFEST+=("$type"$'\t'"$dest"$'\t'"$orig")
}

write_manifest() {
  mkdir -p -- "$STATE_DIR"
  local tmp="$MANIFEST.tmp"
  : > "$tmp"
  local line path
  # keep entries from earlier runs that this run didn't touch (e.g. --libadwaita used before)
  if [ -f "$MANIFEST" ]; then
    while IFS= read -r line; do
      path="$(printf '%s' "$line" | cut -f2)"
      local keep=1 n
      for n in "${NEW_MANIFEST[@]}"; do
        if [ "$(printf '%s' "$n" | cut -f2)" = "$path" ]; then keep=0; break; fi
      done
      if [ "$keep" = 1 ]; then printf '%s\n' "$line" >> "$tmp"; fi
    done < "$MANIFEST"
  fi
  for line in "${NEW_MANIFEST[@]}"; do printf '%s\n' "$line" >> "$tmp"; done
  mv -- "$tmp" "$MANIFEST"
}

print_summary() {
  echo
  say "Summary"
  local s
  for s in "${SUMMARY[@]}"; do echo "    - $s"; done
  if [ -d "$BACKUP_DIR" ]; then echo "    Backups from this run: $BACKUP_DIR"; fi
}

# ---------- safety checks ----------
if [ "${EUID:-$(id -u)}" -eq 0 ]; then
  echo "Please run this as your normal user, not with sudo/root." >&2
  echo "Everything is installed into your own home folder." >&2
  exit 1
fi
for cmd in cp mv mkdir date cut dirname; do
  command -v "$cmd" >/dev/null 2>&1 || { echo "Missing required command: $cmd" >&2; exit 1; }
done
command -v diff >/dev/null 2>&1 || warn "'diff' not found: unchanged files will still be backed up before replacing."

load_manifest

# =====================================================================
# UNINSTALL
# =====================================================================
if [ "$MODE" = "uninstall" ]; then
  if [ ! -f "$MANIFEST" ]; then
    echo "No Stark-Mint install record found at $MANIFEST - nothing was changed."
    exit 1
  fi

  if [ -f "$RESTORE" ]; then
    if [ "$APPLY" != "no" ] && { [ "$APPLY" = "yes" ] || ask "Restore the desktop settings you had before Stark-Mint?"; }; then
      say "Restoring previous desktop settings"
      bash "$RESTORE" || warn "Some settings could not be restored (see messages above)."
      mv -- "$RESTORE" "$RESTORE.used-$STAMP"
      note "restored previous settings (script kept as $RESTORE.used-$STAMP)"
    else
      note "settings NOT restored; run 'bash $RESTORE' yourself if you want them back"
    fi
  fi

  say "Removing Stark-Mint files (moved to $BACKUP_DIR, not deleted)"
  while IFS=$'\t' read -r type path orig; do
    [ -n "${path:-}" ] || continue
    if [ -e "$path" ] || [ -L "$path" ]; then
      label="removed/${type}/$(basename -- "$path")"
      moved="$(backup "$path" "$label")"
      note "removed $path (kept at $moved)"
    fi
    if [ -n "${orig:-}" ] && [ "$orig" != "-" ] && [ -e "$orig" ]; then
      mkdir -p -- "$(dirname -- "$path")"
      mv -- "$orig" "$path"
      note "put back your original $path"
    fi
  done < "$MANIFEST"
  mv -- "$MANIFEST" "$MANIFEST.uninstalled-$STAMP"
  if command -v fc-cache >/dev/null 2>&1; then fc-cache -f >/dev/null 2>&1 || true; fi
  print_summary
  echo
  say "Uninstalled. You can delete $STATE_DIR once you no longer need the backups."
  exit 0
fi

# =====================================================================
# INSTALL
# =====================================================================
[ -f "$HERE/$NAME/index.theme" ] || { echo "Run this from the unpacked Stark-Mint-Theme folder." >&2; exit 1; }

if [ -f "$MANIFEST" ] || [ -e "$THEMES_DIR/$NAME" ]; then
  say "An existing Stark-Mint installation was found. Changed files will be backed up first."
fi

say "Stark-Mint $VERSION - installing theme folders into $THEMES_DIR"
for dir in "$NAME" "$NAME-hdpi" "$NAME-xhdpi"; do
  place theme "$HERE/$dir" "$THEMES_DIR/$dir" "themes/$dir"
done

if [ "$DO_FONTS" = 1 ]; then
  say "Installing fonts into $FONT_DIR"
  place font "$HERE/fonts" "$FONT_DIR" "fonts/StarkMint"
  if command -v fc-cache >/dev/null 2>&1; then
    fc-cache -f "$FONT_DIR" >/dev/null 2>&1 || warn "fc-cache failed; log out and back in to pick up the fonts."
  else
    warn "fc-cache not found; fonts appear after you log out and back in."
  fi
fi

if [ "$DO_WALL" = 1 ]; then
  say "Copying wallpaper to $WALL_DIR"
  place wallpaper "$HERE/wallpaper/stark-mint-wallpaper.png" "$WALL" "wallpaper/stark-mint-wallpaper.png"
fi

if [ "$DO_ADW" = 1 ]; then
  say "Theming GTK4/libadwaita apps via $ADW_DIR"
  warn "Files in $ADW_DIR affect every GTK4 app, whatever theme is selected."
  for f in gtk.css gtk-dark.css assets; do
    place adw "$THEMES_DIR/$NAME/gtk-4.0/$f" "$ADW_DIR/$f" "gtk-4.0/$f"
  done
fi

write_manifest
note "install record: $MANIFEST (used by --uninstall)"

# Dependencies referenced by index.theme (not bundled) - warn only
find_theme() {
  local d
  for d in "$HOME/.icons" "$DATA_HOME/icons" /usr/local/share/icons /usr/share/icons; do
    [ -d "$d/$1" ] && return 0
  done
  return 1
}
find_theme "Tela-circle-Dark" || warn "Icon theme 'Tela-circle-Dark' (named in index.theme) is not installed. Your current icons will be used."
find_theme "Everforest-cursors" || warn "Cursor theme 'Everforest-cursors' (named in index.theme) is not installed. Your current cursor will be used."

# ---------- desktop settings (only with consent) ----------
do_apply=0
case "$APPLY" in
  yes) do_apply=1 ;;
  no)  do_apply=0 ;;
  ask) if ask "Switch your desktop to Stark-Mint now? (your current settings are saved first)"; then do_apply=1; fi ;;
esac

if [ "$do_apply" = 0 ]; then
  note "desktop settings NOT changed - pick 'Stark-Mint' in Themes, or run ./install.sh --apply"
  print_summary
  exit 0
fi

if ! command -v gsettings >/dev/null 2>&1; then
  warn "gsettings not found - pick 'Stark-Mint' manually in your theme settings."
  note "settings not applied (gsettings missing)"
  print_summary
  exit 0
fi

mkdir -p -- "$STATE_DIR"
if [ ! -f "$RESTORE" ]; then
  printf '%s\n' '#!/usr/bin/env bash' \
    '# Puts back the desktop settings you had before Stark-Mint changed them.' \
    '# Each setting is recorded once, the first time Stark-Mint changes it.' > "$RESTORE"
  chmod +x "$RESTORE"
fi

key_ok() { [ "$(gsettings writable "$1" "$2" 2>/dev/null || true)" = "true" ]; }

set_key() {  # set_key <schema> <key> <value>
  local schema="$1" key="$2" value="$3" old
  if ! key_ok "$schema" "$key"; then
    note "skipped $schema $key (not available or locked)"
    return 0
  fi
  old="$(gsettings get "$schema" "$key")"
  if ! grep -qF -- "gsettings set $schema $key " "$RESTORE"; then
    printf 'gsettings set %s %s %q || echo "could not restore %s %s"\n' \
      "$schema" "$key" "$old" "$schema" "$key" >> "$RESTORE"
  fi
  if gsettings set "$schema" "$key" "$value"; then
    note "set $schema $key = $value"
  else
    warn "could not set $schema $key"
  fi
}

DESKTOP="${XDG_CURRENT_DESKTOP:-}"
WALL_URI="file://$WALL"

if [[ "$DESKTOP" == *Cinnamon* ]]; then
  say "Applying to Cinnamon"
  set_key org.cinnamon.desktop.interface gtk-theme "$NAME"
  set_key org.cinnamon.desktop.wm.preferences theme "$NAME"
  set_key org.cinnamon.theme name "$NAME"
  set_key org.gnome.desktop.interface gtk-theme "$NAME"
  if [ "$DO_FONTS" = 1 ]; then
    set_key org.cinnamon.desktop.interface font-name "Barlow 10"
    set_key org.cinnamon.desktop.wm.preferences titlebar-font "Barlow Semi Condensed SemiBold 10"
    set_key org.nemo.desktop font "Barlow 10"
    set_key org.gnome.desktop.interface font-name "Barlow 10"
    set_key org.gnome.desktop.interface monospace-font-name "JetBrains Mono 10"
  fi
  if [ "$DO_WALL" = 1 ]; then set_key org.cinnamon.desktop.background picture-uri "$WALL_URI"; fi
elif [[ "$DESKTOP" == *GNOME* ]]; then
  say "Applying to GNOME"
  set_key org.gnome.desktop.interface gtk-theme "$NAME"
  set_key org.gnome.desktop.interface color-scheme "prefer-dark"
  set_key org.gnome.desktop.wm.preferences theme "$NAME"
  if key_ok org.gnome.shell.extensions.user-theme name; then
    set_key org.gnome.shell.extensions.user-theme name "$NAME"
  else
    note "GNOME top bar not themed: enable the 'User Themes' extension, then run ./install.sh --apply"
  fi
  if [ "$DO_FONTS" = 1 ]; then
    set_key org.gnome.desktop.interface font-name "Barlow 10"
    set_key org.gnome.desktop.interface document-font-name "Barlow 10"
    set_key org.gnome.desktop.interface monospace-font-name "JetBrains Mono 10"
    set_key org.gnome.desktop.wm.preferences titlebar-font "Barlow Semi Condensed SemiBold 10"
  fi
  if [ "$DO_WALL" = 1 ]; then
    set_key org.gnome.desktop.background picture-uri "$WALL_URI"
    set_key org.gnome.desktop.background picture-uri-dark "$WALL_URI"
  fi
else
  warn "Desktop '${DESKTOP:-unknown}' not recognised - pick 'Stark-Mint' manually in your theme settings."
fi

note "to undo the settings: bash $RESTORE   (or ./install.sh --uninstall)"
print_summary
if [[ "$DESKTOP" == *Cinnamon* ]]; then
  echo
  say "If the panel looks unchanged, press Ctrl+Alt+Esc to restart Cinnamon."
fi
exit 0
