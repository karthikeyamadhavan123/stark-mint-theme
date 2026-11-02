# Credits, licences and modification notice

Stark Mint is **not** an original theme written from scratch. It is a modified version of an existing GTK theme, recoloured and restyled.

This file records where each part comes from and which licence applies to it.

Some entries are marked **Needs maintainer verification**. Those are genuinely unresolved, not placeholders. Please do not remove them until the question behind them has actually been answered.

---

## 1. Upstream theme — most of `Stark-Mint/`

| | |
|---|---|
| Project | **Everforest-GTK-Theme** by Fausto-Korpsvart |
| Repository | https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme |
| Variant used | `Everforest-Green-Dark`, plus the `-hdpi` and `-xhdpi` Xfwm folders |
| Licence | **GNU General Public License version 3** |
| Licence source | The `LICENSE` file in the upstream repository, and the GPL-3.0 licence shown on the repository page |

The upstream project credits, in its own README:

- Colours from [Sainnhe's Everforest for Neovim](https://github.com/sainnhe/everforest).
- GTK theme foundations from [vinceliuice's GTK themes](https://github.com/vinceliuice).
- Icon inspiration from [gusbemacbe's Suru Plus icon theme](https://github.com/gusbemacbe/suru-plus).

Because Stark Mint is a modified version of a GPL-3.0 work, the theme files derived from it remain under GPL-3.0. The root `LICENSE` carries that licence text.

**Needs maintainer verification:** the copy of `Everforest-Green-Dark` that Stark Mint started from arrived without a licence, readme or copyright file. The upstream above was identified from the folder name and from the author line inside the Metacity theme files, and matches the public repository. The maintainer should confirm that this is the project the theme was actually downloaded from, and record which upstream version or commit it came from. Recording the upstream commit would let future contributors track upstream fixes.

### Author attribution kept inside the files

- `Stark-Mint/metacity-1/metacity-theme-1.xml`, `-2.xml`, `-3.xml` — each carries `<author>vinceliucie | mod: fkorpsvart</author>` and `<copyright>GPL</copyright>`. These lines are unchanged. Only the `<name>` and `<description>` elements were edited to name Stark Mint.
- vinceliuice's GTK themes, which the upstream theme builds on, are also GPL-3.0. Example: [Colloid-gtk-theme](https://github.com/vinceliuice/Colloid-gtk-theme).

Do not remove these lines. They are the upstream authors' attribution and they are required by the licence.

---

## 2. Third-party notices inside upstream files

These notices are present in the shipped files and must stay there.

| File | Notice | Licence |
|---|---|---|
| `Stark-Mint/gnome-shell/gnome-shell.css` | Copyright 2009, 2015 Red Hat, Inc. Portions adapted from Mx's `data/style/default.css`, Copyright 2009 Intel Corporation. | **GNU LGPL 2.1** — stated in the file header |
| `Stark-Mint/plank/dock.theme` | A comment at the top records that the file is based on Plank's default `dock.theme`, at `https://git.launchpad.net/plank/tree/data/themes/Default/dock.theme` | Plank is GPL-3.0 |

Note on the GNOME Shell stylesheet: its header states LGPL 2.1, not GPL-3.0. The root `LICENSE` does not override it. This is the clearest example of why the root licence cannot be treated as covering the whole repository.

**Needs maintainer verification:** the Plank licence above was checked on the GitHub mirror `ricotz/plank`, not on the original Launchpad project. Worth confirming against Launchpad before a wide release.

---

## 3. Fonts — `fonts/`

| Font | Licence | Licence file in this repository |
|---|---|---|
| Barlow | SIL Open Font License 1.1 | `fonts/OFL-Barlow.txt` |
| Barlow Semi Condensed | SIL Open Font License 1.1 | `fonts/OFL-Barlow.txt` |
| JetBrains Mono | SIL Open Font License 1.1 | `fonts/OFL-JetBrainsMono.txt` |

The fonts were downloaded unmodified from the `google/fonts` repository.

The SIL Open Font License permits bundling and redistribution. It is a separate licence from the root GPL-3.0 and applies to the font files on its own terms. Keep the `OFL-*.txt` files alongside the fonts.

---

## 4. Modified from upstream

These are Stark Mint changes to upstream files. As modifications of a GPL-3.0 work, they are GPL-3.0.

- Every colour in the CSS, SVG, PNG, XML, `gtkrc` and Plank files remapped to the Stark Mint palette.
- Squarer corner radii.
- `STARK MINT overrides` blocks appended to `gtk-3.0/*.css`, `gtk-4.0/*.css`, `cinnamon/cinnamon.css` and `gnome-shell/gnome-shell.css`.
- Rewritten toggle SVGs: `cinnamon/assets/toggle-*.svg` and `gnome-shell/assets/toggle-*.svg`.
- Window frames: `metacity-1/metacity-theme-1.xml`, `-2.xml` and `-3.xml` edited.
- New window control assets: `metacity-1/assets/button.svg`, `close-bg.svg`, `close-bg-hover.svg`, `close-bg-pressed.svg`.
- New thumbnails: `cinnamon/thumbnail.png`, `gtk-3.0/thumbnail.png`, `gtk-4.0/thumbnail.png`, `metacity-1/thumbnail.png`.
- Rewritten `Stark-Mint/index.theme`.

`CHANGELOG.md` has the per-release detail.

---

## 5. Original Stark Mint files

These were created for Stark Mint and are not derived from upstream:

| File | What it is |
|---|---|
| `install.sh` | Installer and uninstaller |
| `preview/gtk3-widgets.png` | Screenshot of the GTK widget factory running under Stark Mint |
| `preview/design-reference.png` | The 1.2.0 Stark Mint design reference sheet |
| `README.md`, `DESIGN.md`, `CONTRIBUTING.md`, `CREDITS.md`, `CHANGELOG.md`, `COLOUR-REPORT.md` | Project documentation |
| `wallpaper/stark-mint-wallpaper.png` | Stark Mint wallpaper — distributed separately, see section 7 |

**Licence: GNU General Public License version 3.**

These files are not derived from the upstream theme, so GPL-3.0 did not reach them automatically. The maintainer has chosen to release them under GPL-3.0 as well, so that a single licence applies consistently across everything the project owns.

```text
Copyright (C) 2026 the Stark Mint authors

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```

The root `LICENSE` holds the full licence text.

Note on `preview/gtk3-widgets.png`: it is a screenshot of GTK's own widget factory test program. The window contents are GTK's, not Stark Mint's. This is almost certainly fine for a theme preview, but it is the reason the file is listed here rather than treated as purely original artwork.

## 6. Referenced but not bundled

`Stark-Mint/index.theme` names two themes that are **not** included in this repository and are not redistributed by it:

| Theme | Type | Setting |
|---|---|---|
| `Tela-circle-Dark` | Icon theme | `IconTheme=` |
| `Everforest-cursors` | Cursor theme | `CursorTheme=` |

Users install these separately. Stark Mint makes no licensing claim over either, and nothing in this repository redistributes them.

**Needs maintainer verification:** if either is ever bundled, its licence and attribution must be added to this file first.

---

## 7. Trademark note and the wallpaper

`wallpaper/stark-mint-wallpaper.png` contains the text "STARK INDUSTRIES // INDUSTRIAL LINUX". `preview/design-reference.png` uses the same name in its layout.

"Stark Industries" and "Iron Man" come from Marvel's Iron Man stories and are Marvel's property.

**The wallpaper is therefore distributed separately from the theme**, as its own download, rather than bundled in this repository.

The reasoning:

- The theme does not need the wallpaper to work. Keeping them apart means the theme can be packaged and redistributed by distributions and third parties without inheriting a branding question.
- Anyone who wants the wallpaper can still download it and drop it into `wallpaper/` before installing. The installer picks it up if it is present and skips it if it is not.
- It keeps the trademark exposure attached to one optional asset rather than to the whole project.

The wallpaper itself is GPL-3.0, like the rest of the project's original files. That covers the copyright in the artwork. It does not and cannot grant any rights in Marvel's trademarks, which is a separate matter from copyright.

Stark Mint is an independent community project. It is not affiliated with, endorsed by or sponsored by Marvel, Disney, Linux Mint or the upstream theme authors. The project name, the README disclaimer and the absence of any claim of affiliation all support that, but none of this is legal advice.

## 8. Modification notice — GPL-3.0 section 5(a)

This is a modified version of Everforest-GTK-Theme (`Everforest-Green-Dark`) by Fausto-Korpsvart.

Modified for Stark Mint in November 2026. See `CHANGELOG.md` for the list of changes.

---

## 9. Summary of what the root LICENSE covers

| Part of the repository | Licence |
|---|---|
| Theme files derived from Everforest-GTK-Theme | GPL-3.0, via the root `LICENSE` |
| Stark Mint's modifications to those files | GPL-3.0, as modifications of a GPL-3.0 work |
| `Stark-Mint/gnome-shell/gnome-shell.css` | LGPL 2.1, per its own header |
| `Stark-Mint/plank/dock.theme` | Based on Plank; GPL-3.0 |
| Bundled fonts | SIL Open Font License 1.1, per `fonts/OFL-*.txt` |
| `install.sh`, documentation, previews | GPL-3.0, by the maintainer's decision — see section 5 |
| Wallpaper | GPL-3.0, but distributed separately — see section 7 |
| `Tela-circle-Dark`, `Everforest-cursors` | Not bundled; not covered |

The root `LICENSE` does **not** automatically cover every file in this repository.

---

## 10. For contributors

If your contribution introduces any third-party asset — an icon, a font, an image, a snippet of someone else's CSS — you must add it to this file, with its source, its author and its licence.

If you cannot establish where an asset came from or what licence it carries, do not submit it. An asset with unclear provenance is a problem the project will inherit permanently.
