# Stark Mint 1.2.0 — Colour Report

**Result:** no theme file (CSS, GTK 2 rc, window-frame XML, SVG, theme PNG, `index.theme`,
`install.sh`) contains cyan, teal or a blue accent. Blue values remain **only** in named colour
lists that no theme rule uses (section 4). The design mock-up image still shows cyan on purpose.

> This report replaces an earlier version that described changes before they were made. Every
> number below comes from the final 1.2.0 files.

Accents: **Metallic Gold `#D6A84E`** (plus `#E5BA63` light, `#C4963F` deep) and **Stark Red
`#B3272D`** (plus the theme's existing `#C93037`, `#E05A60`, `#8E1F24`). Neutrals: forge `#0E0F11`,
graphite `#18191D`, surface `#1F2126`, charcoal `#26282E`, border `#343842`, silver `#A5A9B2`,
bone `#EBE8E2`.

## 1. How it was checked

| Check | Covers | Method |
|---|---|---|
| Exact search | every file except `.git` | 25 retired values (list in section 2) |
| Hue scan | every text file: CSS, rc, XML, SVG, `themerc`, `dock.theme`, `index.theme`, `install.sh`, docs | every `#hex` and `rgb()/rgba()` value classed by hue: cyan/teal 160–205°, blue 205–260°, violet 260–300°, green 75–160° |
| Pixel scan | every PNG | count of visible pixels in the same hue bands |
| Wallpaper | `stark-mint-wallpaper.png` | every pixel, including very faint tints |

"Chroma" below means how strong a colour is (0 = pure grey, 255 = fully saturated).

## 2. Exact search — retired values

Searched: `#7CD6E3`, `rgba(124, 214, 227, …)`, `#A6E6EF`, `#5CBCCB`, `#75B3D2`, `#78D5E2`,
`#3BC2D5`, `#2AB0C3`, `#29ACBF`, `#317CA5`, `#7AD9F1`, `#0F9AC8`, `#2BB7CC`, `#83B6EC`, `#337FDC`,
`#9E91E8`, `#1A73E8`, `#2861C6`, `#6D53E0`, `#393484`, `#1C71D8`, `#4CAF50`, `#455A64`, `#1A1B26`,
`#56635F`, `rgba(72, 85, 94, …)`, `rgba(83, 98, 109, …)`.

| Result | Where |
|---|---|
| **0 hits** for every value in any theme file | — |
| `#1C71D8`: 1 hit per file | `gtk-4.0/gtk.css` and `gtk-dark.css` line 8446, `@define-color blue_4` (named colour list, section 4) |
| Mentions in `CHANGELOG.md` and this report | history / this list |

Words "cyan", "teal", "turquoise", "arc pulse" in theme files: only the GNOME Settings
accent-picker selectors `accent-button.teal` and `var(--accent-teal)` (GTK 4 lines 7932, 7942–7943).

## 3. Hue scan — every colour value in theme files

| Found | Count | Verdict |
|---|---|---|
| Cyan / teal, chroma ≥ 10 | **0** | ✅ |
| Blue, chroma ≥ 20 | GTK 3: 5 (`BLUEBERRY_*`). GTK 4: 10 (`BLUEBERRY_*`, `blue_1`–`5`) | named colour lists only |
| Blue-tinted greys, chroma 10–14 | many | the existing graphite family: `#343842`, `#2A2D34`, `#A5A9B2`, `#6B7079`, `#8A8E96`, plus the three new graphite values below |
| Violet | GTK 3: 5 (`GRAPE_*`). GTK 4: 10 (`GRAPE_*`, `purple_*`) + 3 (avatar 10) | named lists; avatar 10 is purple, not blue — unchanged |
| Green | GTK 3: 5, GTK 4: 10 (`LIME_*`, `green_*`) | named lists |

New neutral values introduced, all in the graphite family (chroma 10–11, below border `#343842` at 14):
`#5d6168` (GTK 3 line 6548), `rgba(80, 83, 90, 0.75)` and `rgba(93, 97, 104, 0.75)` (Cinnamon 2510–2517).

## 4. Pixel scan — PNG files

| File | Before | After |
|---|---|---|
| GTK 3 `scale-*-marks-*-slider(@2).png` (8 non-dark files) | 98 / 446 cyan px each | **0** |
| GTK 3 `selectionmode-checkbox-checked(@2).png` | 1153 / 4620 cyan px | **0** (now identical to the `-dark` files) |
| `thumbnail.png` × 4 | 6–32 cyan px | **0** |
| `wallpaper/stark-mint-wallpaper.png` | 7402 cool px with chroma ≥ 12, strongest 70 | **0**; strongest cool pixel now chroma 5 (graphite level) |
| `preview/gtk3-widgets.png` (re-taken) | 324 cyan px | **0** cyan. 2940 blue px = the colour-picker button showing its blue sample value, set by the test app |
| `preview/design-reference.png` | 4754 cyan, 1764 blue | unchanged (section 6) |
| all GTK 2, Xfwm, other PNGs | 0 | 0 |

## 5. States

| State | GTK 3 | GTK 4 | Cinnamon | GNOME Shell |
|---|---|---|---|---|
| Primary action | gold, dark text | gold, dark text (incl. dialogs, were blue) | gold | gold |
| Pressed primary | `#C4963F` | `#C4963F` | — | — |
| Focus ring | gold | gold | gold | gold |
| Selection | gold (unchanged) | gold (unchanged) | gold (unchanged) | gold (unchanged) |
| Links | gold, visited `#C4963F` | gold, visited `#C4963F` | gold, hover `#E5BA63` | gold, hover `#E5BA63`, pressed `#C4963F` |
| Success | gold | gold | — | — |
| Warning | light gold (unchanged) | light gold; Software warning label was red | light gold (unchanged) | light gold (unchanged) |
| Error | red (unchanged) | red (unchanged) | red (unchanged) | red; dialog error label was gold |
| Information | bone text (was gold) | unchanged | neutral | neutral |
| Destructive | red (unchanged) | red (unchanged) | red (unchanged) | red (unchanged) |

## 6. Syntax and file checks (run on the final files)

| Check | Result |
|---|---|
| GTK 3.24 parser (`gtk3-widget-factory`, virtual display) | 1 error, same as 1.1.0: `gtk.css:1048:16 'border-spacing'` (upstream) |
| GTK 4.14 parser (`gtk4-widget-factory`, virtual display) | 12 errors, line-for-line identical to 1.1.0 (upstream accent picker, lines 7918–7971) |
| All SVG and XML files (`xmllint`) | 110 files, 0 failures |
| CSS braces | balanced in `cinnamon.css` (517), `gnome-shell.css` (1116), `pad-osd.css`, GTK 3 (1602), GTK 4 (1509) |
| `gtkrc` | line 27 well-formed, quotes balanced |
| `install.sh` | `bash -n` OK, ShellCheck clean |
| Line counts | unchanged in every CSS, rc and XML file (only values on existing lines changed) |
| `gtk.css` vs `gtk-dark.css` | still identical (GTK 3 and GTK 4) |
| Screenshots | GTK 3 and GTK 4 widget factories render; link button and primary buttons gold |

Cinnamon and GNOME Shell CSS could only be checked for syntax, not on a running desktop.

## 7. Contrast (WCAG ratio; 4.5 is the normal-text minimum)

| Pair | Ratio |
|---|---|
| Gold link on graphite | 8.00 |
| `#C4963F` visited link on graphite | 6.51 |
| Dark text on gold button (was bone on cyan: 1.36) | 5.73 |
| Dark text on pressed `#C4963F` | 4.86 |
| Dark text on light gold `#E5BA63` (Software tiles, banner) | 6.70 |
| Info-bar bone on graphite | 14.36 |
| Silver `#A5A9B2` on graphite | 7.46 |
| Shell error `#E05A60` on `#1F2126` | 4.45 (the theme's existing red-text colour) |
| White on `#B3272D` / `#8E1F24` (Software "create" tile) | 6.47 / 8.85 |
| `#8E1F24` on cream (Software "work" tile) | 8.26 |

## 8. What is left, and why

1. **`preview/design-reference.png`** — regenerated for 1.2.0. The earlier mock-up carried an
   "Arc Cyan #7CD6E3" swatch; the current sheet does not. A full pixel scan of all 1,590,400
   pixels found no cyan, turquoise, teal, blue or purple. Its palette swatches match the theme
   files exactly: Forge `#0E0F11`, Graphite `#18191D`, Surface `#1F2126`, Charcoal `#26282E`,
   Border `#343842`, Silver `#A5A9B2`, Bone `#EBE8E2`, Metallic Gold `#D6A84E`, Stark Red
   `#B3272D`. It is a design target rather than a screenshot of a running desktop, is referenced
   from the README preview section, and is not installed.
2. **Named colour lists** — GTK 3 `BLUEBERRY_*` (8555–8559), GTK 4 `BLUEBERRY_*` (8413–8417) and
   `blue_1`–`5` (8443–8447), plus the green and purple lists. No theme rule uses them (0 references).
   They exist so an app that asks for "blue" by name gets blue.
3. **GNOME Settings accent picker** (GTK 4 7932–7971) — selectors named `.teal`, `.blue` that point
   to the colour the user is choosing. They declare no colour, and GTK skips them (they are the
   12 known parser errors).
4. **Non-cyan Everforest leftovers**, outside this task's scope (not cyan, teal or blue):
   - sage grey `#9da9a0` knob in the GTK 3 `*-disabled*` slider-mark PNGs;
   - 2–27 yellow-green edge pixels around the gold knob in the GTK 3 `-dark` slider-mark PNGs;
   - a few olive edge pixels in GTK 2 `checkbox/radio-*-active.png`;
   - the `-dark` selection checkbox tick is a near-black with a faint green tint (24, 27, 19).
   These can be neutralised in a follow-up if wanted.
