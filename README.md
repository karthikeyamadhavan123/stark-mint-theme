# Stark Mint

**Forged in graphite. Defined by red and gold.**

Stark Mint is an open-source desktop theme inspired by the Iron Man Mark III armor and Stark Industries aesthetic.

Built on the Everforest-GTK-Theme foundation, Stark Mint modifies and extends the original theme to establish its own visual identity: a dark graphite interface with metallic gold interaction accents and Stark red identity details.

The project aims to provide a cohesive, industrial and modern desktop experience across supported Linux desktop components.

## Design Philosophy

Stark Mint follows a deliberately restricted visual system.

- **Graphite** forms the foundation of the interface.
- **Metallic Gold** represents interaction, focus and active states.
- **Stark Red** represents identity, errors and destructive actions.
- No third accent colour is part of the design.

The objective is not simply to create another dark theme. It is to build a consistent visual identity while preserving readability, usability and desktop conventions.

Read [DESIGN.md](DESIGN.md) for the complete design principles and colour guidelines.

## Preview

### GTK Widgets

![Stark Mint GTK widget preview](preview/gtk3-widgets.png)

The preview demonstrates the theme's GTK controls, including buttons, switches, sliders, selection and focus states.

More screenshots of the Cinnamon desktop, file manager and application menu will be added as the project develops.

## Colour Palette

| Colour | Hex | Purpose |
|---|---|---|
| Forge | `#0E0F11` | Deep background |
| Graphite | `#18191D` | Main background |
| Surface | `#1F2126` | Raised surfaces |
| Charcoal | `#26282E` | Secondary surfaces |
| Border | `#343842` | Separators and outlines |
| Silver | `#A5A9B2` | Secondary text |
| Bone | `#EBE8E2` | Primary text |
| Stark Red | `#B3272D` | Identity and destructive actions |
| Metallic Gold | `#D6A84E` | Focus and interaction |

Controlled shades of red and gold are used for hover, pressed and other interface states.

See [COLOUR-REPORT.md](COLOUR-REPORT.md) for the colour audit.

## Features

- Dark graphite visual foundation.
- Stark Red and Metallic Gold accent system.
- GTK 2, GTK 3 and GTK 4 theme components.
- Cinnamon desktop styling.
- GNOME Shell styling.
- Metacity/Muffin window decorations.
- Xfwm window decorations, including HiDPI variants.
- Plank dock theme.
- Barlow and JetBrains Mono fonts.
- Installation and uninstallation script with backup support.

Component availability and testing status vary by desktop environment and version. See the compatibility section below.

## Installation

### Requirements

- A Linux desktop environment with support for the relevant theme components.
- A terminal.
- Git is optional if you clone the repository.

### Method 1 — Download ZIP

1. Download the Stark Mint repository as a ZIP.
2. Extract the archive.
3. Open a terminal inside the extracted `Stark-Mint-Theme` directory.
4. Run:

```bash
chmod +x install.sh
./install.sh
```

The installer will:

1. Copy the theme into `~/.themes`.
2. Install the bundled fonts into `~/.local/share/fonts/StarkMint`.
3. Copy the wallpaper into `~/Pictures/Stark-Mint`.
4. Ask before changing desktop settings.

If you decline the settings changes, the files are still installed but your current desktop settings remain unchanged.

### Method 2 — Clone the repository

```bash
git clone git@github.com:karthikeyamadhavan123/stark-mint-theme.git
cd Stark-Mint-Theme
chmod +x install.sh
./install.sh
```

Replace `<REPOSITORY_URL>` with the actual GitHub repository URL.

### Installer options

| Option | Description |
|---|---|
| `--apply` | Apply the theme, fonts and wallpaper without asking. |
| `--no-apply` | Copy files without changing desktop settings. |
| `--no-fonts` | Skip font installation and font settings. |
| `--no-wallpaper` | Skip wallpaper installation and settings. |
| `--libadwaita` | Also apply GTK 4 styling through `~/.config/gtk-4.0`. |
| `--uninstall` | Uninstall Stark Mint and optionally restore previous settings. |
| `--yes` | Automatically answer yes to installer questions. |

**Important:** The `--libadwaita` option changes GTK 4 configuration under your home directory and can affect all GTK 4 applications. Existing configuration files are backed up first.

No root or `sudo` privileges are required.

## Uninstallation

To uninstall Stark Mint, run the following from the extracted project directory:

```bash
./install.sh --uninstall
```

The uninstaller:

- Asks whether to restore previous desktop settings.
- Moves installed files into the backup directory rather than immediately deleting them.
- Restores files that were backed up before installation.

Backups are stored under:

```text
~/.local/share/stark-mint/
```

To restore only your previous desktop settings:

```bash
bash ~/.local/share/stark-mint/restore-settings.sh
```

Once you are certain you no longer need the backups, you can remove the backup directory.

## Manual Configuration

Some desktop customisations are controlled by the desktop environment rather than the theme itself.

### Cinnamon menu button

Right-click the Menu button, select Configure, open the Panel section and set its text to `MENU`.

### Cinnamon clock

Right-click the clock, open Configure and enable a custom date format.

Example:

```text
%a %b %e  %H:%M:%S
```

### GNOME Shell

Enable the User Themes extension before applying the GNOME Shell theme.

Run:

```bash
./install.sh --apply
```

## Theme Components

| Directory | Description |
|---|---|
| `Stark-Mint/` | Main GTK, Cinnamon, GNOME Shell, Metacity and Plank theme |
| `Stark-Mint-hdpi/` | HiDPI Xfwm window decorations |
| `Stark-Mint-xhdpi/` | Extra-HiDPI Xfwm window decorations |
| `fonts/` | Bundled Barlow and JetBrains Mono fonts |
| `wallpaper/` | Stark Mint desktop wallpaper |
| `preview/` | Project screenshots |

### External dependencies

The theme references the following icon and cursor themes:

- `Tela-circle-Dark`
- `Everforest-cursors`

These are not bundled with Stark Mint. Install them separately if you want those exact icon and cursor appearances.

## Compatibility and Testing

Stark Mint primarily targets Linux Mint Cinnamon.

The following table distinguishes between implementation checks and actual desktop testing.

| Component | Current status |
|---|---|
| GTK 2 | Included; runtime compatibility not yet fully verified |
| GTK 3 | Loaded with GTK 3.24 parser; no new errors reported |
| GTK 4 | Parser checked; visual testing still required |
| Cinnamon 6.4 | Selectors checked against Cinnamon 6.4.13 source; runtime testing pending |
| Cinnamon 6.6+ | Menu selectors checked against Cinnamon 6.6.4 class names; runtime testing pending |
| Cinnamon 6.2 and older | Not verified |
| GNOME Shell | Syntax checked; runtime testing pending |
| Metacity/Muffin | XML and referenced assets checked; runtime testing pending |
| Xfwm | Included; runtime testing pending |
| Installer | Shell syntax and ShellCheck verified; tested in an isolated user environment, not yet fully validated on a real desktop |

Testing status will be updated as more desktop environments and versions are verified.

## Known Limitations

- GTK cannot force all window titles to use uppercase text.
- Some Cinnamon window-button settings are controlled independently of the theme.
- Some upstream CSS properties may be ignored by particular desktop versions.
- GTK 4 and libadwaita applications may not follow third-party themes consistently.
- Not every desktop component has been tested on a running desktop environment.

Known limitations and fixes are documented in [CHANGELOG.md](CHANGELOG.md).

## Contributing

Contributions, bug reports and suggestions are welcome.

You can help improve:

- GTK and Cinnamon styling.
- Window decorations.
- Icon coverage and design.
- Accessibility and contrast.
- Compatibility.
- Installation and packaging.
- Documentation.

Before contributing, please read:

- [DESIGN.md](DESIGN.md) — Project identity and design principles.
- [CONTRIBUTING.md](CONTRIBUTING.md) — Contribution guidelines.

The goal is to improve the implementation without compromising the Stark Mint identity.

**Improve the execution. Preserve the identity.**

## Licensing and Attribution

Stark Mint is based on Everforest-GTK-Theme by Fausto-Korpsvart.

The upstream theme is distributed under the GNU General Public License version 3. Individual components and bundled assets may have their own licensing and attribution requirements.

- [LICENSE](LICENSE) — Main GPL-3.0 licence.
- [CREDITS.md](CREDITS.md) — Upstream sources, modifications and third-party licences.

Bundled fonts retain their respective SIL Open Font Licence files.

Please review the individual notices before redistributing modified or extracted components.

## Disclaimer

Stark Mint is an independent community project inspired by the Iron Man visual aesthetic.

It is not affiliated with, endorsed by or sponsored by Marvel, Disney, Linux Mint or the upstream theme authors. All respective trademarks and intellectual property belong to their owners.
