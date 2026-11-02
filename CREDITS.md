# Credits, licences and modification notice

Stark-Mint is **not** an original theme written from scratch. It is a modified
version of an existing GTK theme, recoloured and restyled to the Stark Mint
design. This file lists where each part comes from and which licence applies.

## 1. Upstream theme (most of `Stark-Mint/`)

| | |
|---|---|
| Upstream project | **Everforest-GTK-Theme** by Fausto-Korpsvart — https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme |
| Variant used | `Everforest-Green-Dark` (plus `-hdpi` / `-xhdpi` Xfwm folders) |
| Licence | **GNU GPL version 3** (upstream `LICENSE` file; same text included here as `LICENSE`) |
| Upstream credits (from its README) | Colours from Sainnhe's *Everforest* for Neovim; built on vinceliuice's GTK themes; inspired by gusbemacbe's *Suru Plus* icons |

Author attribution kept in the files themselves:

- `Stark-Mint/metacity-1/metacity-theme-*.xml` — `<author>vinceliucie | mod: fkorpsvart</author>`, `<copyright>GPL</copyright>` (kept unchanged; only the theme `<name>` and `<description>` were changed).
- vinceliuice's themes (e.g. Colloid-gtk-theme, https://github.com/vinceliuice/Colloid-gtk-theme) are also GPL-3.0.

**How the upstream was identified:** the theme you supplied (`Themes.zip`) contained
no licence, readme or copyright file. The upstream above was identified from the
folder name (`Everforest-Green-Dark`) and the Metacity author line. Please confirm
this matches where you downloaded it.

## 2. Third-party notices inside upstream files (kept unchanged)

- `Stark-Mint/gnome-shell/gnome-shell.css` — header: *Copyright 2009, 2015 Red Hat, Inc.;
  portions Copyright 2009 Intel Corporation*, **GNU LGPL 2.1** (GNOME Shell's stylesheet).
- `Stark-Mint/plank/dock.theme` — comment says it is based on Plank's default
  `dock.theme`. Plank is GPL-3.0 (checked on the GitHub mirror `ricotz/plank`,
  not on the original Launchpad project).

## 3. Fonts (`fonts/`)

| Font | Licence | Licence file |
|---|---|---|
| Barlow, Barlow Semi Condensed | SIL Open Font License 1.1 | `fonts/OFL-Barlow.txt` |
| JetBrains Mono | SIL Open Font License 1.1 | `fonts/OFL-JetBrainsMono.txt` |

Downloaded unmodified from the google/fonts repository.

## 4. Stark Mint changes and additions

Modified from upstream (GPL-3.0 applies, as a modified version of a GPL-3.0 work):

- All colours in CSS, SVG, PNG, XML, gtkrc and Plank files remapped to the Stark Mint palette.
- Squarer corner radii; appended "STARK MINT overrides" blocks at the end of
  `gtk-3.0/*.css`, `gtk-4.0/*.css`, `cinnamon/cinnamon.css`, `gnome-shell/gnome-shell.css`.
- Rewritten toggle SVGs (`cinnamon/assets/toggle-*.svg`, `gnome-shell/assets/toggle-*.svg`).
- Window frames: `metacity-1/metacity-theme-*.xml` edited; new `metacity-1/assets/button.svg`,
  `close-bg.svg`, `close-bg-hover.svg`, `close-bg-pressed.svg`.
- New thumbnails (`cinnamon/thumbnail.png`, `gtk-3.0/thumbnail.png`, `gtk-4.0/thumbnail.png`,
  `metacity-1/thumbnail.png`) and a rewritten `index.theme`.

New files not derived from upstream — **licence to be confirmed by the package owner**:

- `install.sh`, `wallpaper/stark-mint-wallpaper.png`, `preview/gtk3-widgets.png`
  (a screenshot of GTK's own test program using this theme).
- These were made for this package. They have no separate licence yet. GPL-3.0
  would be the simplest match for the rest of the package, but that is your decision.

Not covered by any licence here:

- `preview/design-reference.png` — the Stark Mint design mock-up supplied by the
  package owner. Its terms are not established; remove it before sharing the
  package publicly unless you know you may redistribute it.

Not bundled (only referenced by `Stark-Mint/index.theme`): the icon theme
`Tela-circle-Dark` and the cursor theme `Everforest-cursors`.

## 5. Modification notice (GPL-3.0 section 5a)

This is a modified version of Everforest-GTK-Theme (Everforest-Green-Dark).
Modified for Stark Mint in November 2026. See `CHANGELOG.md` for the list of changes.

## 6. Trademark note

The wallpaper text ("STARK INDUSTRIES // INDUSTRIAL LINUX") and the design mock-up
use the name "Stark Industries", which comes from Marvel's Iron Man stories and is
Marvel's property. That is fine for personal use. If you plan to share this package
publicly, consider removing that text from the wallpaper.
