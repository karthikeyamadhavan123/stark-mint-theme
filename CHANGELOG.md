# Changelog

## 0.2.0 — colour system correction (November 2026)

Cyan, teal and blue accents are removed. Stark Mint now has two accent families,
**Metallic Gold** `#D6A84E` and **Stark Red** `#B3272D`, plus the existing neutrals.
No redesign: layouts, fonts, sizes and backgrounds are unchanged, and no lines were added
or removed in any CSS, rc or XML file (only values on existing lines changed).

> **Correction note.** An earlier draft of this changelog and of `COLOUR-REPORT.md` described
> these changes before they had been made — the files still contained cyan. This entry and the
> report have been rewritten to match the files as they now are, and every search result in the
> report comes from the final files.

Each old colour was given gold, red or a neutral **by what the element does**. Line numbers are
the same in 0.1.0 and 0.2.0. `gtk.css` and `gtk-dark.css` are identical and got the same edits.

| Old | New | Used for |
|---|---|---|
| `#7CD6E3` cyan | `#D6A84E` gold | primary buttons, focus rings, links, success, progress, drag-and-drop, checkboxes |
| `#A6E6EF` light cyan | `#C4963F` (visited links) / `#E5BA63` (link hover) | links |
| `#75B3D2`, `#5CBCCB` | `#C4963F` | pressed primary button, pressed link |
| `#317CA5` blue | `#D6A84E` | GTK 4 dialog primary buttons |
| bone text on cyan/blue buttons | `rgba(31, 33, 38, 0.87)` | the theme's existing text-on-gold colour (`accent_fg_color`); contrast 1.36 → 5.73 |
| cyan for "cold" / "night" | silver `#A5A9B2` | neutral information, not an action |
| slate-blue greys | graphite greys of the same lightness | neutral |

### GTK 3 — `Stark-Mint/gtk-3.0/gtk.css`, `gtk-dark.css` (20 lines each)

- 804–805: `button.suggested-action` cyan → gold, text bone → dark.
- 816, 824, 828, 843: primary-button glow, focus ring, flat-checked → gold. 820: pressed `#75b3d2` → `#c4963f`. 833: flat primary text → gold.
- 939, 947: links → gold. 943, 951: visited → `#c4963f`.
- 3094: `levelbar block.full` → gold. 3612: message-dialog primary text → gold.
- 3912: info bar text gold → bone (information is neutral). Info-bar *button* text (3921) stays gold.
- 6548: Firefox checkbox hover `#56635f` (teal-grey) → graphite `#5d6168`, same lightness.
- 8510: `success_color` → gold.
- 8592, 8785, 8789 (Stark override block): "arc #7CD6E3" removed from the token comment; "Links = arc pulse" → gold.

### GTK 4 — `Stark-Mint/gtk-4.0/gtk.css`, `gtk-dark.css` (78 lines each)

- 160: `.success` → gold. 582–644: `entry.success` focus ring, selection and icons → gold.
- 1261–1262, 1412–1413, 1540–1541, 1680–1681, 4466–4467: suggested / menubutton / splitbutton /
  list-row / success-row primary buttons → gold with dark text.
- 1277: pressed → `#c4963f`. 1285, 1290, 1299: focus ring, flat text, flat checked → gold.
- 1694, 1702: links → gold. 1698, 1706: visited → `#c4963f`.
- 3868: `levelbar block.full` → gold. 4446: success-row selection → gold.
- 4810–4811, 4845–4846: dialog primary buttons were **blue** `#317ca5` → gold with dark text.
- 8368, 8497, 8499: `success_color` / `success_bg_color` → gold. 8498: `success_fg_color` bone → dark (as warning/accent).
- 8451–8452: named colours `green_4` / `green_5` had been turned cyan; restored to the GNOME values `#2ec27e` / `#26a269`.
- 8531, 8724, 8728 (Stark override block): token comment and link rule → gold.
- App-specific rules:
  - GNOME Software tiles: "create" violet→blue → red gradient `#b3272d`→`#8e1f24` (6466–6476);
    "learn" cyan → gold gradient with dark text (6496–6507); "play" yellow/pink/blue-violet with navy
    text → gold gradient with dark text (6511–6522); "work" blue text → dark red `#8e1f24` (6541, 6550, 6556).
    "socialize" and "develop" unchanged.
  - Software upgrade banner → gold with dark text (6747–6748).
  - Software rating lozenges: "green" → gold text on faint gold (6882–6883, olive text was unreadable on dark);
    "blue" → silver (6887–6888).
  - Software `row.app label.warning` red → gold `#e5ba63` (6983): warnings are gold.
  - Weather "cold" and low temperature → silver (7015, 7085). Search highlight → gold (7117). Clocks "night" → silver (7231–7232).
  - Avatars 1–3 (blue, cyan, teal) → three gradients made only of existing neutrals (7598–7609);
    avatar 11 (periwinkle) → existing reds `#e05a60`→`#8e1f24` (7648–7649). Others unchanged.

### GTK 2 — `Stark-Mint/gtk-2.0/gtkrc`

- Line 27: `link_color` → `#D6A84E`, `visited_link_color` → `#C4963F`.

### Cinnamon — `Stark-Mint/cinnamon/cinnamon.css` (17 lines)

- 379, 3042: links → gold. 384, 3046: link hover → `#e5ba63`.
- 597–598, 629–630: panel drag-and-drop highlight → gold.
- 1133, 1157: calendar all-day "now" event and "current" countdown → gold.
- 2137–2138, 2263–2264: window-list progress bars → gold.
- 2510, 2512, 2517: workspace-graph windows slate-blue → graphite of the same lightness.

### GNOME Shell — `Stark-Mint/gnome-shell/gnome-shell.css` (13 lines)

- 95–105: `.shell-link` and its hover/active backgrounds → gold.
- 1209, 1213, 1217: Looking Glass links → gold / `#e5ba63` / `#c4963f`.
- 3672, 3978, 4284: `.url-highlighter` → gold.
- 3155, 3394: `prompt-dialog-error-label` gold → light Stark red `#e05a60` (errors are red).

### Metacity / Muffin, Xfwm, Plank

- No changes needed: no cyan, teal or blue in `metacity-theme-*.xml`, `themerc` files, Xfwm PNGs or `dock.theme`.

### SVG assets (24 values in 17 files)

- Cinnamon `checkbox.svg`, `radiobutton.svg`, `add-workspace-active.svg`, GNOME Shell `checkbox.svg`:
  cyan fill → gold, near-white mark → forge `#0e0f11` (now match the existing `-dark` versions).
- Cinnamon `corner-ripple.svg`: cyan fill and a hidden green `#4caf50` attribute → gold.
- `checkbox-dark.svg` (Cinnamon and Shell), `radiobutton-dark.svg`: navy-black mark `#1a1b26` → forge `#0e0f11`.
- 8 `scale-*-marks-*-slider-symbolic.svg` (GTK 3 and 4): blue gradient stop `#1A73E8` → gold.
- GNOME Shell `noise-texture.svg`: hidden blue-grey `#455A64` attributes → `#444444` (the value already drawn).

### PNG assets

- GTK 3 `scale-*-marks-*-slider(@2).png` (the 8 non-dark files): cyan knob and its yellow-green edge pixels → gold.
  The `-dark` and `-disabled` files were already gold/grey and are unchanged.
- GTK 3 `selectionmode-checkbox-checked(@2).png`: cyan box → now the same image as the existing `-dark` version (gold box, dark tick).
- `thumbnail.png` (Cinnamon, GTK 3, GTK 4, Metacity): the small cyan dot → gold.
- `wallpaper/stark-mint-wallpaper.png`: teal triangle → faint Stark red (same strength as before);
  the steel-blue tint in the lower-left glow and the blue text fringes → graphite (colour strength capped at the
  graphite level, brightness unchanged). Size, layout and gold ring unchanged.
- `preview/gtk3-widgets.png`: re-taken with the 0.2.0 theme (`gtk3-widget-factory`, virtual display).

### Metadata and docs

- `index.theme`: description no longer says "arc pulse".
- `install.sh`: `VERSION` 0.1.0 → 0.2.0 (no other change).
- `README.md`: version, new colour table (replaces "cyan for links and success"), note that the mock-up is historical.
- `COLOUR-REPORT.md`: rewritten with the real search results.

### Left unchanged on purpose

- `preview/design-reference.png`: the original mock-up still shows "Arc Cyan". It is a record of the
  original design, not a theme asset.
- Named colour lists for apps (GTK 3 `BLUEBERRY_*`, `LIME_*`, `GRAPE_*`; GTK 4 `blue_1`–`5`, `green_*`, `purple_*`):
  no theme rule uses them, and an app asking for "blue" by name should still get blue.
- GNOME Settings accent-picker rules (`accent-button.teal`, `.blue`, …): they only reference the
  colour being chosen and declare no colour. GTK skips these lines anyway.
- Green-grey and olive leftovers from Everforest that are not cyan, teal or blue (disabled slider
  knobs `#9da9a0`, a few edge pixels in GTK 2 and `-dark` slider PNGs). See `COLOUR-REPORT.md`.

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
