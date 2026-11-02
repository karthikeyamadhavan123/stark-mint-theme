# Stark-Mint 1.2.0

A dark industrial theme for Linux Mint (Cinnamon) and GNOME. It's a modified
version of **Everforest-GTK-Theme (Everforest-Green-Dark)**, recoloured to the
Stark Mint design. See `CREDITS.md` for sources and licences.

## Colours

Two accent colours plus neutrals. There is no cyan, teal or blue accent.

| Colour | Value | Used for |
|---|---|---|
| Metallic Gold | `#D6A84E` | focus, selection, primary buttons, links, progress, success, checkboxes |
| Gold variants | `#E5BA63` light, `#C4963F` deep | warnings and hover (light); pressed buttons and visited links (deep) |
| Stark Red | `#B3272D` (theme also uses `#C93037`, `#E05A60`, `#8E1F24`) | errors, close, destructive actions |
| Neutrals | forge `#0E0F11`, graphite `#18191D`, surface `#1F2126`, charcoal `#26282E`, border `#343842`, silver `#A5A9B2`, bone `#EBE8E2` | text, backgrounds, secondary text, information |

Text on gold buttons is dark (`rgba(31, 33, 38, 0.87)`, the theme's normal text-on-gold colour).
See `COLOUR-REPORT.md` for how this was checked.

## Install

```bash
unzip Stark-Mint-Theme.zip
cd Stark-Mint-Theme
./install.sh
```

What the installer does:

1. Copies the theme into `~/.themes`, the fonts into `~/.local/share/fonts/StarkMint`
   and the wallpaper into `~/Pictures/Stark-Mint` (your Pictures folder).
2. **Asks** before changing any desktop setting. If you say no, or it isn't run
   from a terminal, no settings are changed.

Before anything is replaced, it is moved to `~/.local/share/stark-mint/backups/<date-time>/`.
Nothing is deleted. No `sudo` is needed.

If the panel doesn't change after applying, press **Ctrl+Alt+Esc** to restart Cinnamon.

| Option | What it does |
|---|---|
| `--apply` | Apply the theme, fonts and wallpaper without asking. |
| `--no-apply` | Only copy files. Never change desktop settings. |
| `--no-fonts` | Don't install the fonts or change font settings. |
| `--no-wallpaper` | Don't copy or set the wallpaper. |
| `--libadwaita` | Also theme newer GTK4 apps (like Settings) through `~/.config/gtk-4.0`. This affects every GTK4 app whatever theme is selected. Your existing files there are backed up first. |
| `--uninstall` | Remove what the installer added (see below). |
| `--yes` | Answer "yes" to the installer's questions. |

## Undo / uninstall

```bash
./install.sh --uninstall
```

- It asks whether to restore the desktop settings you had before.
- It moves the installed files into the backup folder (it doesn't delete them).
- It puts back anything of yours that the installer had replaced, for example
  your own `~/.config/gtk-4.0/gtk.css`.

To restore only your old settings: `bash ~/.local/share/stark-mint/restore-settings.sh`

When you no longer need the backups, delete `~/.local/share/stark-mint`.

## Finishing touches (manual)

A theme can't change these:

- **Menu button text:** right-click the Menu button, choose *Configure*, then *Panel*,
  and set the text to `MENU`. The red border goes on the first applet on the left
  of each panel, which is normally the menu.
- **Clock with seconds:** right-click the clock, choose *Configure*, turn on
  *Use a custom date format*, and enter `%a %b %e  %H:%M:%S`.
- **GNOME top bar:** enable the *User Themes* extension, then run `./install.sh --apply`.

## What's inside

```
Stark-Mint/          main theme: GTK 2/3/4, Cinnamon, GNOME Shell, window frames (Metacity), Plank, Xfwm
Stark-Mint-hdpi/     Xfwm (Xfce) window frames for HiDPI - only used on Xfce
Stark-Mint-xhdpi/
fonts/               Barlow, Barlow Semi Condensed, JetBrains Mono + their OFL licence files
wallpaper/           2560x1440 wallpaper
preview/             GTK3 test screenshot + the original design mock-up (historical: it still shows the retired cyan)
install.sh           installer / uninstaller
LICENSE              GNU GPL v3 (licence of the upstream theme)
CREDITS.md           sources, licences, modification notice
CHANGELOG.md         list of changes
```

The theme names `Tela-circle-Dark` icons and the `Everforest-cursors` cursor in
`index.theme`. These are **not** included. If they aren't installed, your current
icons and cursor stay.

## Compatibility and testing status

| Part | Status |
|---|---|
| GTK 3 | Loaded with the real GTK 3.24 parser: no new errors. Widget screenshot checked under a virtual display. |
| GTK 4 | Loaded with the real GTK 4 parser: no new errors. **Not** visually tested. libadwaita apps mostly ignore themes unless `--libadwaita` is used, and even then not fully. |
| Cinnamon 6.4 | Selectors and properties checked against Cinnamon 6.4.13 source. **Not** tested on a running desktop. |
| Cinnamon 6.6+ | The new `.appmenu-*` menu rules match 6.6.4 class names. **Not** tested on a running desktop. |
| Cinnamon 6.2 and older | Not checked. |
| GNOME Shell | Syntax checked only. Needs the User Themes extension. |
| Window frames (Metacity/Muffin) | XML is valid and every referenced file exists. **Not** tested on a running desktop. |
| Installer | `bash -n` and ShellCheck clean. Tested in a separate user account with a stand-in for `gsettings`, **not** on a real desktop. |

## Known limits

- GTK can't force UPPERCASE text, so window titles keep normal case.
- `index.theme`'s `ButtonLayout` line is informational. Cinnamon uses its own
  window-button setting.
- Some upstream rules use properties Cinnamon/GNOME Shell simply ignore. They are
  harmless and were left in place (see `CHANGELOG.md`).
