# Stark Mint 1.2.0 — Colour Report

**Result: cyan is gone from the theme.** No file that styles anything (CSS, GTK 2 rc, window-frame
XML, SVG and PNG assets, metadata) declares `#7CD6E3`, any other cyan or teal, or a blue accent.
The only cyan left in the package is inside two images that are records, not styling (see
"What is left, and why").

Final accent families: **Metallic Gold `#D6A84E`** and **Stark Red `#B3272D`**. Neutrals:
Forge `#0E0F11`, Graphite `#18191D`, Charcoal, Silver, Bone `#EBE8E2`.

## 1. What was searched

| Kind | Files | Method |
|---|---|---|
| Text | Every non-binary file: GTK 2/3/4 CSS and rc, Cinnamon and GNOME Shell CSS, Metacity XML, Xfwm `themerc`, Plank theme, `index.theme`, `install.sh`, README/CREDITS/CHANGELOG | Exact search for every retired value, plus a hue scan of **every** `#hex` and `rgb()/rgba()` colour |
| SVG | All 107 SVGs | Same as text, plus XML parse check |
| PNG | All theme PNGs, thumbnails, wallpaper, previews | Pixel scan for cyan/teal, blue and green hues |

Retired values searched for: `#7CD6E3`, `rgba(124, 214, 227, …)`, `#A6E6EF`, `#5CBCCB`, `#75B3D2`,
`#78D5E2`, `#3BC2D5`, `#2AB0C3`, `#29ACBF`, `#317CA5`, `#7AD9F1`, `#0F9AC8`, `#2BB7CC`, `#83B6EC`,
`#9E91E8`, `#1A73E8`, `#4CAF50`, `#455A64`, `#1A1B26`, `#56635F`.

## 2. Results

**Exact search:** 0 hits in any theme file. The only mentions are in `CHANGELOG.md` (history, and
this release's list of what was removed) and this report.

**Hue scan of every colour value** (cyan/teal = hue 160–205° with visible colour; blue = 205–260°;
green = 75–160°):

| Found | Where | Verdict |
|---|---|---|
| Cyan / teal | none | ✅ |
| Blue: `#94A6FF`…`#031579` (`BLUEBERRY_*`), `#99C1F1`…`#1A5FB4` (`blue_1`–`5`) | GTK 3 / GTK 4 `@define-color` lines only | Named colours for apps. **No rule in the theme uses them** (checked: 0 references). Kept on purpose. |
| Green: `LIME_*`, `green_1`–`5` | same | same as above |
| Cool dark greys, e.g. `#1F2126`, `#343842`, `#2A2D34` | everywhere | The existing graphite neutral family (very low colour). Not accents. |

**PNG pixel scan:**

| File | Before | After |
|---|---|---|
| GTK 3 `selectionmode-checkbox-checked(@2).png` | solid cyan | gold |
| GTK 3 `scale-*-marks-*.png` (32 files) | cyan + green-grey leftovers | gold / warm grey; only the theme's cool dark greys remain |
| GTK 2 `*-active.png` (4 files) | 1–6 olive edge pixels | gold hue |
| 4 × `thumbnail.png` | cyan dot | gold dot |
| `wallpaper/stark-mint-wallpaper.png` | cyan triangle, cyan glow, blue font fringes | **0 cyan pixels, 0 blue pixels** |
| `preview/gtk3-widgets.png` | 345 cyan pixels (link) | **0 cyan pixels**. The remaining blue pill is the colour-picker button showing its value (content set by the test app, not the theme). |
| `preview/design-reference.png` | cyan | unchanged — see below |

## 3. States checked

| State | GTK 3 | GTK 4 | Cinnamon | GNOME Shell |
|---|---|---|---|---|
| Primary action | gold, forge text | gold, forge text (incl. dialogs, previously blue) | gold | gold |
| Focus ring | gold | gold | gold | gold |
| Selection | gold (unchanged) | gold (unchanged) | gold (unchanged) | gold (unchanged) |
| Active / pressed | gold `#C4963F` | gold `#C4963F` | gold | gold |
| Links | gold, visited `#C4963F` | gold, visited `#C4963F` | gold, hover `#E5BA63` | gold |
| Success | gold (`success_color`, levelbar full) | gold (`.success`, `entry.success`, `success_*_color`) | — | — |
| Warning | gold light (unchanged) | gold light; Software warning label fixed from red | gold light (unchanged) | gold light (unchanged) |
| Error | red (unchanged) | red (unchanged) | red (unchanged) | red; two error labels fixed from gold |
| Information | **bone on graphite** (was gold text) | bone on graphite (unchanged) | neutral (unchanged) | neutral (unchanged) |
| Destructive | red (unchanged) | red (unchanged) | red (unchanged) | red (unchanged) |

## 4. Real-parser and file checks

| Check | Result |
|---|---|
| GTK 3.24 parser (`gtk3-widget-factory`, virtual display) | 1 error, same as before 1.2.0 (`border-spacing`, line 1048, upstream) |
| GTK 4 parser (`gtk4-widget-factory`, virtual display) | 12 errors, identical to before 1.2.0 (upstream accent-picker lines 7918–7971) |
| GTK 3 screenshot vs 1.1.0 | Only the link button changed (cyan → gold), plus 9 edge pixels on the marked-slider knob (green-grey → warm grey) |
| GTK 4 screenshot | Renders correctly; link gold |
| All SVG and XML files | 110 files parse as valid XML |
| Cinnamon / GNOME Shell CSS | Braces balanced; line counts unchanged (3148 / 6194) |
| Files added / removed | 1 added (this report); 0 removed |

## 5. Contrast (WCAG ratio, 4.5:1 = normal-text minimum)

| Pair | Ratio |
|---|---|
| Gold link on graphite `#18191D` | 8.00 |
| Visited link `#C4963F` on graphite | 6.51 |
| Forge text on gold primary button | 8.74 (was bone on cyan: **1.36**) |
| Forge text on pressed gold `#C4963F` | 7.11 |
| Info text bone on graphite | 14.36 |
| Silver `#C3C5C9` on graphite | 10.16 |
| Shell error label `#E05A60` on `#1F2126` | 4.45 (same red the theme already uses for red text) |
| Software tiles: forge on gold / white on Stark red / dark red on cream | 7.11 / 5.30–8.85 / 8.26 |
| Avatars 1–3, 11 | 5.34 – 7.98 |

## 6. What is left, and why

1. **`preview/design-reference.png`**, the original design mock-up, still shows an "Arc Cyan
   #7CD6E3" swatch and "Arc Pulse" labels. It is kept unchanged because editing labels inside a
   design image would turn it into a misleading record. README marks it as historical; the colour
   table in README is the current spec. It can be deleted or redrawn if you prefer.
2. **Named colour lists** (GTK 3 `BLUEBERRY_*`, `LIME_*`, etc.; GTK 4 `blue_*`, `green_*`): these
   are for apps that ask for a colour by name, and the theme never uses them.
3. **GNOME Settings accent picker** (`accent-button.blue`, `.teal`, …): the swatches show the colour
   being picked. GTK skips these lines anyway.

## 7. Neutral values — note

Your spec lists Charcoal `#26282D` and Silver `#C3C5C9`. The theme had `#26282E` (45 uses) and
`#A5A9B2` (32 uses). To avoid a redesign, these were **not** swapped:
`#26282E` is visually identical to `#26282D`, and `#A5A9B2` is kept as "muted silver" for secondary
text, scrollbars and switch knobs. `#C3C5C9` is used for the new informational states. A global
swap is a one-line change if you want it.

## 8. Not tested

Like 1.1.0, nothing here was tested on a running Cinnamon or GNOME desktop. GTK 3 and GTK 4 were
checked with the real GTK parsers and screenshots under a virtual display. Cinnamon and GNOME Shell
changes are colour-value swaps inside existing rules, checked by syntax only.
