# Stark Mint

**Forged in graphite. Defined by red and gold.**

Stark Mint is an open-source desktop theme inspired by the Iron Man Mark III armour and the Stark Industries aesthetic.

It is built on the `Everforest-Green-Dark` variant of [Everforest-GTK-Theme](https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme), which has been modified and extended to create its own visual identity: a dark graphite interface with metallic gold interaction accents and Stark red identity details.

The project targets Linux Mint Cinnamon first, with generic styling for other GTK desktops.

**Current version:** 0.1.0

---

## Contents

- [Design philosophy](#design-philosophy)
- [Preview](#preview)
- [Colour palette](#colour-palette)
- [Typography](#typography)
- [What is implemented](#what-is-implemented)
- [Installation](#installation)
- [Uninstallation](#uninstallation)
- [Manual configuration](#manual-configuration)
- [Project layout](#project-layout)
- [Dependencies](#dependencies)
- [Compatibility and testing](#compatibility-and-testing)
- [Known limitations](#known-limitations)
- [Planned work](#planned-work)
- [Reporting bugs and contributing](#reporting-bugs-and-contributing)
- [Licensing and attribution](#licensing-and-attribution)
- [Disclaimer](#disclaimer)

---

## Design philosophy

Stark Mint uses a deliberately narrow visual system.

- **Graphite** forms the foundation of the interface.
- **Metallic Gold** marks interaction: focus, selection and active states.
- **Stark Red** marks identity, errors and destructive actions.
- There is no third accent colour.

The goal is not simply another dark theme. It is a consistent visual identity that still respects readability, usability and normal desktop conventions.

[DESIGN.md](DESIGN.md) is the full reference for the design rules.

---

## Preview

### GTK 3 widgets

![Stark Mint GTK 3 widget preview](preview/gtk3-widgets.png)

A screenshot of the GTK widget factory running under Stark Mint. It shows buttons, entries, switches, sliders, lists and selection and focus states.

### Design reference

![Stark Mint 1.2.0 design reference](preview/design-reference.png)

The 1.2.0 design reference sheet. It shows the intended Cinnamon panel, menu and file manager layout, GTK control states, notifications, and the full colour and typography system.

This sheet is a design target, not a screenshot of a running desktop. Where it differs from the shipped theme, the shipped theme is the current state of the project.

Screenshots of a real Cinnamon desktop will be added as the project is tested on more systems. See [How to contribute](CONTRIBUTING.md) if you would like to send one.

---

## Colour palette

These values are taken from the theme files themselves.

| Colour | Hex | Purpose |
|---|---|---|
| Forge | `#0E0F11` | Deepest background: entries, rails |
| Graphite | `#18191D` | Main background: views, panels |
| Surface | `#1F2126` | Raised surfaces: windows, cards |
| Charcoal | `#26282E` | Secondary surfaces: buttons |
| Border | `#343842` | Separators and hairlines |
| Silver | `#A5A9B2` | Secondary text and information |
| Bone | `#EBE8E2` | Primary text |
| Metallic Gold | `#D6A84E` | Focus, selection, primary actions, warnings |
| Stark Red | `#B3272D` | Identity, errors, destructive actions, close |

### Controlled variations

These are shades of the two accent families. They are not extra accent colours.

| Colour | Hex | Use |
|---|---|---|
| Light Gold | `#E5BA63` | Hover and raised gold surfaces |
| Deep Gold | `#C4963F` | Pressed gold, visited links |
| Light Red | `#E05A60` | Red text on dark backgrounds |
| Error Red | `#C93037` | Error state colour (`error_color`), close button hover in window frames |
| Deep Red | `#8E1F24` | Pressed red |

[COLOUR-REPORT.md](COLOUR-REPORT.md) records the colour audit and the measured contrast ratios.

---

## Typography

The theme references three font families, all bundled under `fonts/`.

| Family | Used for |
|---|---|
| Barlow | General interface text, menus, labels, body copy |
| Barlow Semi Condensed SemiBold | Title bars and headings |
| JetBrains Mono | Terminals, file sizes, timestamps, clock |

When you let the installer change your desktop settings, it sets the interface font to Barlow 10, the title bar font to Barlow Semi Condensed SemiBold 10, and the monospace font to JetBrains Mono 10. You can change these afterwards without breaking the theme.

---

## What is implemented

- GTK 2, GTK 3 and GTK 4 styling.
- Cinnamon desktop styling: panel, menu, notifications, OSD, applets.
- GNOME Shell styling.
- Metacity/Muffin window decorations, in three frame variants.
- Xfwm window decorations, with HiDPI and extra-HiDPI variants.
- A Plank dock theme.
- Bundled Barlow and JetBrains Mono fonts.
- An installer and uninstaller with backups.
- A matching wallpaper, distributed separately.

Not every component has been tested on a running desktop. See [Compatibility and testing](#compatibility-and-testing) for the honest status of each.

---

## Installation

### Requirements

- A Linux desktop that can use GTK themes.
- A terminal.
- Bash.
- For GTK 2 applications: the Adwaita and pixmap GTK 2 engines. On Debian and Mint these come from `gnome-themes-extra` and `gtk2-engines-pixbuf`. Without them, GTK 2 applications fall back to a default look. GTK 3, GTK 4 and Cinnamon do not need these.

No root access is needed. Everything is installed under your home directory.

### Method 1 — download a ZIP

1. Download the repository as a ZIP from GitHub.
2. Extract it.
3. Open a terminal in the extracted folder.
4. Run:

```bash
chmod +x install.sh
./install.sh
```

### Method 2 — clone the repository

```bash
git clone https://github.com/karthikeyamadhavan123/stark-mint-theme.git
cd stark-mint-theme
chmod +x install.sh
./install.sh
```

### What the installer does

1. Copies `Stark-Mint`, `Stark-Mint-hdpi` and `Stark-Mint-xhdpi` into `~/.themes`.
2. Installs the bundled fonts into `~/.local/share/fonts/StarkMint`.
3. Copies the wallpaper into `~/Pictures/Stark-Mint`, if you have downloaded it.
4. Asks before changing any desktop setting.

If you say no to step 4, the files are still installed but your current settings are left alone. You can then apply the theme yourself from your desktop's appearance settings.

Nothing is deleted. Anything that would be replaced is first moved into a timestamped backup folder.

### Installer options

| Option | Description |
|---|---|
| `--apply` | Apply the theme, fonts and wallpaper without asking. |
| `--no-apply` | Copy files only; never change desktop settings. |
| `--no-fonts` | Skip font installation and font settings. |
| `--no-wallpaper` | Skip wallpaper installation and settings. |
| `--libadwaita` | Also apply GTK 4 styling through `~/.config/gtk-4.0`. |
| `--uninstall` | Uninstall Stark Mint and optionally restore previous settings. |
| `--yes`, `-y` | Answer yes to questions. Same as `--apply` when installing. |
| `-h`, `--help` | Show the built-in help. |

**Note on `--libadwaita`:** this writes into `~/.config/gtk-4.0`, which affects every GTK 4 and libadwaita application, not just one. Existing files there are backed up first.

---

## Uninstallation

Run this from the project folder:

```bash
./install.sh --uninstall
```

The uninstaller:

- Asks whether to restore your previous desktop settings.
- Moves installed files into the backup folder instead of deleting them.
- Restores files that were backed up before installation.

Backups live under:

```text
~/.local/share/stark-mint/
```

To restore only your previous desktop settings:

```bash
bash ~/.local/share/stark-mint/restore-settings.sh
```

Once you are sure you no longer need them, you can delete the backup folder yourself.

---

## Manual configuration

Some touches are controlled by the desktop, not by the theme.

### Cinnamon menu button

Right-click the Menu button, choose Configure, open the Panel section and set its text to `MENU`.

### Cinnamon clock

Right-click the clock, choose Configure, enable a custom date format and use something like:

```text
%a %b %e  %H:%M:%S
```

### GNOME Shell

Enable the User Themes extension before the GNOME Shell theme can be applied.

---

## Project layout

| Path | Contents |
|---|---|
| `Stark-Mint/` | Main theme: GTK 2, GTK 3, GTK 4, Cinnamon, GNOME Shell, Metacity, Xfwm, Plank |
| `Stark-Mint-hdpi/` | HiDPI Xfwm window decorations |
| `Stark-Mint-xhdpi/` | Extra-HiDPI Xfwm window decorations |
| `fonts/` | Bundled Barlow and JetBrains Mono fonts and their licences |
| `preview/` | Screenshots and the design reference sheet |
| `install.sh` | Installer and uninstaller |

---

## Dependencies

### Bundled

Fonts only. Barlow, Barlow Semi Condensed and JetBrains Mono ship with the theme under the SIL Open Font License 1.1.

### The wallpaper

The Stark Mint wallpaper is distributed **separately from the theme**, as its own download. It is not part of this repository.

This is deliberate. The wallpaper carries Stark Industries branding, and keeping it out of the theme package means the theme itself can be packaged and redistributed without that complication.

The theme does not need the wallpaper. If you have downloaded it, place it at:

```text
wallpaper/stark-mint-wallpaper.png
```

before running the installer, and it will be installed and applied like any other component. If it is not there, the installer skips that step and everything else works normally.

### Referenced but not bundled

`Stark-Mint/index.theme` points at two themes that Stark Mint does **not** ship:

| Theme | Type |
|---|---|
| `Tela-circle-Dark` | Icon theme |
| `Everforest-cursors` | Cursor theme |

Install these separately if you want the exact icon and pointer appearance. Without them your desktop falls back to whatever icon and cursor themes you already have. Everything else in Stark Mint still works.

Stark Mint does not yet have its own icon theme. Building one is an open area for contributors — see [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Compatibility and testing

Stark Mint primarily targets Linux Mint Cinnamon.

The table below separates what has been *checked in the files* from what has been *tested on a running desktop*. Please do not read a checked entry as a tested one.

| Component | Status |
|---|---|
| GTK 2 | Included; runtime behaviour not yet verified |
| GTK 3 | Loads under the GTK 3.24 parser with no new errors |
| GTK 4 | Parser checked; visual testing still needed |
| Cinnamon 6.4 | Selectors checked against Cinnamon 6.4.13 source; runtime testing pending |
| Cinnamon 6.6+ | Menu selectors checked against Cinnamon 6.6.4 class names; runtime testing pending |
| Cinnamon 6.2 and older | Not verified |
| GNOME Shell | Syntax checked; runtime testing pending |
| Metacity/Muffin | XML and referenced assets checked; runtime testing pending |
| Xfwm | Included; runtime testing pending |
| Installer | Shell syntax and ShellCheck clean; exercised in an isolated user environment, not yet validated on a full desktop |

If you run Stark Mint on a desktop that is not listed as tested, a compatibility report is a genuinely useful contribution. See [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Known limitations

- GTK cannot force every window title into uppercase, so title case varies by application.
- Some Cinnamon window-button settings are controlled by Cinnamon, not by the theme.
- Some CSS properties inherited from upstream are ignored by particular desktop versions.
- GTK 4 and libadwaita applications do not follow third-party themes consistently.
- Stark Mint has no icon theme of its own yet and relies on an external one.
- Most components have been checked in the files but not yet confirmed on a running desktop.

Fixes and detailed notes are in [CHANGELOG.md](CHANGELOG.md).

---

## Planned work

These are intentions, not promises, and not yet implemented:

- A Stark Mint icon theme, so the project stops depending on an external icon set.
- Real desktop screenshots for Cinnamon, the file manager and the application menu.
- Runtime testing across more Cinnamon, GNOME and Xfce versions.
- Optional, modular styling for individual applications.
- Further accessibility and contrast work.

---

## Reporting bugs and contributing

Bug reports, compatibility reports, screenshots and code are all welcome.

**To report a bug**, open a GitHub Issue and include your distribution and version, your desktop environment and version, the affected component, what you expected, what happened, and a screenshot if the problem is visual.

**To contribute**, read these first:

- [DESIGN.md](DESIGN.md) — the visual identity and the rules that protect it.
- [CONTRIBUTING.md](CONTRIBUTING.md) — areas open for contribution and the pull request workflow.

Contributions are not limited to bug fixes. Icons, GTK styling, Cinnamon components, window decorations, optional application themes, accessibility and documentation are all open.

**Improve the execution. Preserve the identity.**

---

## Licensing and attribution

Stark Mint is a modified version of Everforest-GTK-Theme (`Everforest-Green-Dark`) by Fausto-Korpsvart, which is licensed under the GNU General Public License version 3.

The root [LICENSE](LICENSE) is the full GPL-3.0 text. It covers the theme files derived from that upstream work, and it also covers Stark Mint's own original files — the installer, the documentation and the preview images — which are released under **GPL-3.0** by choice.

It does **not** automatically cover every file in this repository. Some components keep their own licences:

- `Stark-Mint/gnome-shell/gnome-shell.css` carries a GNU LGPL 2.1 header from GNOME Shell.
- The bundled fonts are under the SIL Open Font License 1.1, with their licence files in `fonts/`.

[CREDITS.md](CREDITS.md) lists every component, its origin and its licence, and marks the items that still need the maintainer to confirm their status.

Please read those notices before you redistribute this theme or any part of it.

---

---
##Some Proofs
<img width="3019" height="1667" alt="work2" src="https://github.com/user-attachments/assets/29a082a6-b16d-427a-b5c2-5edf036d5248" />
<img width="2677" height="1920" alt="work1" src="https://github.com/user-attachments/assets/11d072ac-fd0e-4d30-9ed6-a5ff35316612" />
<img width="3019" height="1667" alt="work2" src="https://github.com/user-attachments/assets/353f2f23-6d79-4b88-abc1-e4b2e9757aec" />

---

## Disclaimer

Stark Mint is an independent, community-driven project inspired by the Iron Man visual aesthetic.

It is not affiliated with, endorsed by or sponsored by Marvel, Disney, Linux Mint, the Linux Mint team, or the authors of the upstream theme. "Iron Man", "Stark Industries", "Marvel" and "Linux Mint" belong to their respective owners.
