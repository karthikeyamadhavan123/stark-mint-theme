# Changelog

## 1.2.0 — colour system correction (November 2026)

Cyan is removed. Stark Mint now has two accent colour families only: **Metallic Gold**
`#D6A84E` and **Stark Red** `#B3272D`, plus neutrals. No redesign: layouts, fonts,
backgrounds and component designs are unchanged. Each old cyan use was given gold, red or a
neutral **by what the element does**, not by a blanket swap. Line numbers below are from
version 1.1.0. `gtk.css` and `gtk-dark.css` are identical and got the same edits.

Colour mapping used:

| Old | New | Where |
|---|---|---|
| `#7CD6E3` cyan | `#D6A84E` gold | primary buttons, focus rings, links, success, progress, drop highlights, checkboxes |
| `#A6E6EF` light cyan (visited / hover links) | `#C4963F` (visited) or `#E5BA63` (hover) | links |
| `#75B3D2` steel blue (primary pressed) | `#C4963F` | buttons |
| `#7CD6E3` (weather "cold", clock "night") | `#C3C5C9` silver | neutral, not an action |
| Bone text on cyan buttons | Forge `#0E0F11` text on gold | readability (was 1.4:1, now 8.7:1) |

### GTK 3 — `Stark-Mint/gtk-3.0/gtk.css`, `gtk-dark.css`

- Lines 804–805: base `button.suggested-action` cyan → gold, text bone → forge.
- Lines 816, 824, 828, 843: primary-button glow, focus ring and flat-checked cyan → gold.
- Line 820: pressed `#75b3d2` → `#c4963f`. Line 833: flat primary text → gold.
- Lines 939, 947: links → gold. Lines 943, 951: visited links → `#c4963f`.
- Line 3094: `levelbar block.full` → gold (success).
- Line 3612: message-dialog primary-button text → gold.
- Line 3912: **info bar text gold → bone** (information is neutral; matches GTK 4).
- Line 8510: `success_color` → gold.
- Line 6548: Firefox unchecked-checkbox hover `#56635f` (Everforest green-grey) → neutral `#5d6168`, same lightness.
- Lines 8592, 8785, 8789 (Stark override block): token comment no longer lists "arc";
  "Links = arc pulse" rule → gold.

### GTK 4 — `Stark-Mint/gtk-4.0/gtk.css`, `gtk-dark.css`

- Line 160: `.success` → gold. Lines 582–644: `entry.success` focus ring, selection and icons → gold.
- Lines 1261–1262, 1412–1413, 1540–1541, 1680–1681, 4466–4467: primary buttons
  (suggested / menubutton / splitbutton / list-row / success-row) cyan → gold, text → forge.
- Lines 1277, 1285, 1290, 1299: pressed, focus ring, flat text, flat checked → gold family.
- Lines 1694, 1702: links → gold. Lines 1698, 1706: visited → `#c4963f`.
- Line 3868: `levelbar.full` → gold. Line 4446: success-row selection → gold.
- Lines 4810–4811, 4845–4846: message-dialog primary buttons were **blue** `#317ca5` → gold, text → forge.
- Lines 8497–8499, 8368: `success_bg_color` / `success_color` → gold; `success_fg_color`
  bone → dark (same as warning) so text on gold stays readable.
- Lines 8451–8452: named colours `green_4` / `green_5` had been turned cyan by an earlier
  recolour; restored to the standard GNOME values `#2ec27e` / `#26a269`. These are named
  colours for apps, not theme accents (see README).
- Lines 8531, 8724, 8728 (Stark override block): token comment and link rule → gold.
- App-specific styling that used cyan or blue:
  - GNOME Software category tiles: "create" purple→blue gradient → Stark red gradient (lines 6466–6476);
    "learn" cyan gradient → gold gradient with dark text (6496–6507); "play" yellow→pink→blue-violet
    with dark-blue text → gold gradient with forge text (6511–6522); "work" blue text → dark red
    `#8e1f24` (6541, 6550, 6556). The "socialize" (pink) and "develop" (grey) tiles are unchanged.
  - GNOME Software upgrade banner cyan → gold with dark text (6747–6748).
  - GNOME Software rating lozenges: "green" (good) → gold, "blue" → neutral silver (6882–6888).
  - GNOME Software `row.app label.warning` red → gold `#e5ba63` (6983), because warnings are gold.
  - GNOME Weather "cold" and low temperature → silver `#c3c5c9` (7015, 7085).
  - Search highlight `#78d5e2` → gold (7117). Clocks "night" → silver (7231–7232).
  - Avatar colours 1–3 (blue, cyan, teal) → three neutral steel tones (7598–7609);
    avatar 11 (periwinkle blue) → Stark red (7648–7649). Avatars 4–10 and 12–14 unchanged.

### GTK 2 — `Stark-Mint/gtk-2.0/gtkrc`

- Line 27: `link_color` `#7CD6E3` → `#D6A84E`, `visited_link_color` `#A6E6EF` → `#C4963F`.

### Cinnamon — `Stark-Mint/cinnamon/cinnamon.css`

- Lines 379, 3042: links → gold. Lines 384, 3046: link hover → `#e5ba63`.
- Lines 597–598, 629–630: panel drag-and-drop highlight → gold.
- Lines 1133, 1157: calendar "happening now" / all-day event → gold.
- Lines 2137–2138, 2263–2264: window-list progress bars → gold.
- Lines 2510, 2512, 2517: workspace-graph windows were slate-blue → neutral grey of the same lightness.

### GNOME Shell — `Stark-Mint/gnome-shell/gnome-shell.css`

- Lines 95–105: `.shell-link` and its hover/active backgrounds → gold.
- Lines 1209, 1213, 1217: Looking Glass links → gold / `#e5ba63` / `#c4963f`.
- Lines 3672, 3978, 4284: `.url-highlighter` link colour → gold.
- Lines 3155, 3394: `prompt-dialog-error-label` was **gold** → light Stark red `#e05a60`
  (errors are red; `#e05a60` keeps it readable at 4.5:1).

### SVG assets

- Cinnamon `checkbox.svg`, `radiobutton.svg`, `add-workspace-active.svg`, GNOME Shell `checkbox.svg`:
  cyan fill → gold, white mark → forge (matches the existing `-dark` versions).
- Cinnamon `corner-ripple.svg`: cyan fill and a hidden green `#4caf50` attribute → gold.
- `checkbox-dark.svg` (Cinnamon and Shell), `radiobutton-dark.svg`: navy-black mark `#1a1b26` → forge `#0e0f11`.
- 8 `scale-*-marks-*-slider-symbolic.svg` files (GTK 3 and 4): unused blue gradient
  `#1A73E8` → gold. No visible change (GTK recolours symbolic icons).
- GNOME Shell `noise-texture.svg`: hidden `#455A64` attribute → `#444444` (the value already shown).

### PNG assets

- GTK 3 `selectionmode-checkbox-checked(@2).png`: cyan → gold.
- GTK 3 `scale-*-marks-*.png` (all 32): cyan and leftover Everforest green-grey pixels → gold or
  warm grey of the same lightness. Disabled versions stay grey.
- GTK 2 `checkbox/radio-*-active.png`: 1–6 leftover olive edge pixels each → gold hue.
- `thumbnail.png` (Cinnamon, GTK 3, GTK 4, Metacity): the small cyan dot → gold.
- `wallpaper/stark-mint-wallpaper.png`: cyan arc-reactor triangle → Stark red (same faint style as
  the gold ring); the cyan glow in the lower-left corner → neutral graphite; the caption's
  coloured sub-pixel font fringes → plain grey. Layout and everything else unchanged.
- `preview/gtk3-widgets.png`: re-taken with the updated theme.

### Metadata and docs

- `index.theme`: description no longer says "arc pulse".
- `install.sh`: `VERSION` 1.1.0 → 1.2.0 (no other change).
- `README.md`: new colour-system section and state table; note on the design mock-up.
- Added `COLOUR-REPORT.md` (the validation report for this release).

### Left unchanged on purpose

- **`preview/design-reference.png`**, the original design mock-up, still shows "Arc Cyan" and
  "Arc Pulse". Editing labels inside an image would make it a misleading record, so it is kept
  as-is and README marks it as historical.
- **Named colour lists** for apps: GTK 3 `STRAWBERRY_*`, `BLUEBERRY_*`, `LIME_*` and similar;
  GTK 4 `blue_*`, `green_*` and similar. The theme never uses them.
- **GNOME Settings accent picker** swatches (`accent-button.teal` and similar): they show the colour
  being chosen, and GTK skips these lines anyway.
- **Cool dark neutrals** such as `#1F2126`, `#343842`, `#2A2D34`: these are the existing graphite
  family, not accents.
- Existing red/gold choices that already fit the rules, for example urgent windows in red.
- **Neutral values:** the theme keeps `#26282E` (charcoal) and `#A5A9B2` (muted silver) where they
  were. Spec silver `#C3C5C9` is used for the new informational states.

## 1.1.0 — technical correction release (November 2026)

No redesign. Colours, fonts and layout stay the same except where a fix makes an
intended style actually work (noted as "visible effect").

### Cinnamon — `Stark-Mint/cinnamon/`

- `cinnamon.css` lines 5, 11, 16, 23: `15ptpt` / `13ptpt` / `11ptpt` / `9ptpt` → `15pt` / `13pt` / `11pt` / `9pt`.
  Inherited from upstream. *Visible effect:* these sizes for dialog titles,
  OSDs and prompt labels were being ignored before and now apply.
- `cinnamon.css` (Stark override block, was line 2898): added `.menu-category-button:hover`.
  Cinnamon 6.4 marks hovered menu categories with `:hover`. The old
  `.menu-category-button-hover` class is kept for older versions.
- `cinnamon.css` (Stark override block, was lines 2869–2872): removed a
  `.popup-separator-menu-item` rule that had no effect. The base rule sets
  `-gradient-height: 0`, so the colours it set were never drawn.
- `cinnamon.css` (end of file): added styling for the **Cinnamon 6.6+ menu**,
  which renamed its classes from `.menu-*` to `.appmenu-*`. It uses the same
  colours as the existing menu rules. Cinnamon 6.4 and older ignore these rules.
- `assets/close-hover.svg`: leftover Everforest pink `#e67e80` / `#ff7a80` → Stark red `#e05a60`.
- `assets/close-active.svg`: leftover Everforest orange `#f57d26` / `#d8354a` → Stark red `#8e1f24`.
  *Visible effect:* the expo/overview window-close button no longer turns pink or orange.

### Window frames — `Stark-Mint/metacity-1/`

- `metacity-theme-1.xml`, `-2.xml`, `-3.xml` lines 87 and 99: `version="< 3.1"` → `version="&lt; 3.1"`.
  The XML is now well-formed. The value Metacity reads is unchanged.

### GTK 3 — `Stark-Mint/gtk-3.0/`

- `gtk.css` and `gtk-dark.css` lines 2824–2973 (12 lines, 24 references):
  slider tick-mark images pointed to `assets/scale-*-dark*.svg`, which do not exist.
  They now point to the `.png` files that do exist. Inherited from upstream.
  *Visible effect:* tick marks on marked sliders now show.
- `gtk.css` and `gtk-dark.css` line 4267: `assets/cursor-handle-symbolic.svg` →
  `assets/scalable/cursor-handle-symbolic.svg`, the actual file location.
- Leftover Everforest colours the first recolour missed:
  - `#e69875` (orange, drag-and-drop highlight, lines 1066–1067) → gold `#e5ba63`.
  - `#df69ba` (pink, visited links, lines 943 and 951) → light cyan `#a6e6ef`.

### GTK 4 — `Stark-Mint/gtk-4.0/`

- `gtk.css` and `gtk-dark.css`, leftover Everforest colours:
  - `#e69875` → `#e5ba63` at lines 1200, 1201, 1831, 1832, 3147, 3148 and 7237.
  - `#df69ba` → `#a6e6ef` at lines 1698 and 1706.
  - `#dbbc7f` → `#e5ba63` at lines 6712, 6726 and 7243.

### GNOME Shell — `Stark-Mint/gnome-shell/`

- `gnome-shell.css`: 22 more `ptpt` → `pt`, at lines 350, 448, 463, 503, 751, 1099,
  1115, 1134, 1384, 1437, 1560, 2536, 2541, 2598, 2739, 2754, 2760, 2774, 2799,
  2810, 3003 and 3242.
- `gnome-shell.css` line 1958: `weight: bold` (not a real property) → `font-weight: bold`.

### Installer — `install.sh` (rewritten)

- **No settings change without consent.** The installer now asks first.
  If you aren't at a terminal it changes nothing. `--apply` and `--yes` skip
  the question; `--no-apply` never changes settings.
- **Nothing is silently deleted.** Before anything is replaced, it is moved to
  `~/.local/share/stark-mint/backups/<date-time>/`. This covers theme folders,
  fonts, the wallpaper and `~/.config/gtk-4.0` files. Files that are already
  identical are left alone.
- **Detects an existing install,** including a folder called `Stark-Mint` that
  you made yourself. Your own folder is kept and is put back on uninstall.
- **Install record** `~/.local/share/stark-mint/manifest.tsv` lists exactly what
  was installed. Only those paths are ever touched.
- **New `--uninstall`.** It asks before restoring settings, moves installed files
  to the backup folder (doesn't delete them) and puts your original files back.
- **Reliable settings restore** (`restore-settings.sh`):
  - Each setting's original value is saved once, the first time it is changed,
    so running the installer again never overwrites your real originals.
  - A setting first changed in a later run is still recorded.
  - After use the script is renamed, so it can't be run twice by mistake.
- **Locked or missing settings keys** are skipped and listed. Before, they could
  stop the script halfway and leave settings partly changed.
- **Refuses to run as root.** No `sudo` is needed.
- **Warns** if `Tela-circle-Dark` or `Everforest-cursors` (named in `index.theme`)
  aren't installed, and if `fc-cache` or `diff` are missing.
- **Shows a summary** at the end, including the backup folder.

### Package

- Added `LICENSE` (GNU GPL v3, the upstream licence).
- Added `CREDITS.md` (sources, licences, modification notice).
- Added `CHANGELOG.md` (this file).
- Updated `README.md`.
- Re-took `preview/gtk3-widgets.png` with the corrected GTK3 files.

### Checked and left unchanged on purpose

- **Duplicate properties inside the same rule**, all from upstream: 5 in Cinnamon,
  14 in GNOME Shell, 2 in GTK3, 14 in GTK4. The last value wins, so removing them
  wouldn't change anything.
- **Properties Cinnamon/GNOME Shell ignore**, from upstream: `offset-y`, `z-index`,
  `outline`, `caret-color`, `text-decoration`, `background-position`.
- **A debug-looking rule** at `cinnamon.css` around line 815,
  `.workspace-thumbnail-indicator { outline: 2px solid red; border: 1px solid green; }`.
  It comes from upstream.
- **Your own sound-player tweak** in `cinnamon.css` uses `text-overflow`,
  `-st-max-width` and `opacity`. Cinnamon probably ignores these; the tweak is kept as written.
- **Pre-existing GTK parser errors** inherited from upstream:
  - GTK3: `border-spacing` at line 1048.
  - GTK4: 12 errors, mostly around lines 7918–7971 (`--accent-bg-color` etc.).
  - Upstream relies on GTK skipping these lines.
