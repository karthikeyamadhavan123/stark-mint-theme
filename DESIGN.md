# Stark Mint — Design Principles

**Tagline: Forged in graphite. Defined by red and gold.**

## 1. Project Identity

Stark Mint is an open-source Linux desktop theme inspired by the Iron Man Mark III armor and Stark Industries aesthetic.

It aims to create a desktop experience that feels:

- Industrial and precise.
- Dark, clean and modern.
- Premium without being visually noisy.
- Functional, readable and consistent.
- Recognisably Stark Mint across supported desktop components.

The visual identity is built around a dark graphite foundation with two accent colour families: Stark Red and Metallic Gold.

Stark Mint is based on Everforest-GTK-Theme, with modifications and extensions to establish its own visual identity.

## 2. Core Colour Palette

The following colours define the foundation of Stark Mint.

| Name | Hex | Purpose |
|---|---|---|
| Forge | `#0E0F11` | Deep background |
| Graphite | `#18191D` | Main background |
| Charcoal | `#26282D` | Secondary surfaces |
| Silver | `#C3C5C9` | Secondary text and neutral elements |
| Bone | `#EBE8E2` | Primary text |
| Stark Red | `#B3272D` | Identity and destructive actions |
| Metallic Gold | `#D6A84E` | Interaction and active states |

### Controlled colour variations

Lighter and darker shades may be used for interaction states, contrast and visual hierarchy.

Gold variations:
- Light Gold: `#E5BA63`
- Deep Gold: `#C4963F`

Red variations:
- Light Red: `#E05A60`
- Standard Red: `#B3272D`
- Deep Red: `#8E1F24`

These variations belong to the existing two accent families. They do not introduce additional accent colours.

## 3. Colour Responsibilities

Each accent colour has a defined responsibility.

### Metallic Gold — Interaction

Gold represents interaction and active states.

Appropriate uses include:

- Focus indicators.
- Selected items.
- Primary buttons.
- Active controls.
- Progress indicators.
- Interactive links.
- Hover and pressed states where appropriate.

Gold should make interactive elements easy to identify without overwhelming the interface.

### Stark Red — Identity and Danger

Red represents Stark Mint's identity and important actions.

Appropriate uses include:

- Branding and identity details.
- Close and destructive actions.
- Error indicators.
- Important warnings.
- Selected visual details.

Red should be used deliberately rather than applied to every component.

### Graphite and Neutral Colours — Foundation

Neutral colours establish the interface.

They are responsible for:

- Application backgrounds.
- Panels and menus.
- Cards and secondary surfaces.
- Borders and separators.
- Primary and secondary text.
- Disabled interface elements.

The neutral foundation should remain visually dominant.

## 4. Design Restrictions

The following restrictions protect Stark Mint's identity.

### Prohibited accent families

The following colours must not be introduced as theme accent families:

- Cyan.
- Turquoise.
- Teal.
- Blue.
- Green.
- Purple.
- Other competing accent colours.

Third-party application icons may retain their original colours. Their recognisability should not be sacrificed merely to enforce palette uniformity.

Third-party application content and imagery are not required to follow the theme palette.

### Visual restrictions

Avoid:

- Excessive glow effects.
- Decorative gradients without a functional purpose.
- Excessive borders and outlines.
- Unnecessary visual complexity.
- Low-contrast text and controls.
- Decoration that reduces usability.

## 5. User Interface Principles

Stark Mint prioritises usability alongside appearance.

All supported components should aim for:

- Readable text and sufficient contrast.
- Consistent spacing and visual hierarchy.
- Clear normal, hover and active states.
- Visible keyboard focus.
- Distinguishable disabled states.
- Clearly identifiable destructive actions.
- Consistent styling across supported applications and desktop components.

Accessibility and usability improvements are always welcome.

## 6. Component Guidelines

Stark Mint consists of multiple desktop components.

| Component | Responsibility |
|---|---|
| GTK 3 | GTK 3 application styling |
| GTK 4 | GTK 4 application styling |
| Cinnamon | Desktop shell, panels and menus |
| Metacity | Window decorations |
| Icons | Application and system icon appearance |
| Cursors | Pointer appearance |
| Wallpapers | Desktop visual identity |

The objective is to make supported components feel like parts of one coherent theme.

### Window controls

Window controls follow the Stark Mint colour philosophy:

- Minimize, maximize and close use Stark Red in their default state.
- Minimize and maximize transition to Metallic Gold on hover.
- The close control retains a distinct red identity.
- Active and hover states should remain recognisable.
- Avoid excessive glow and decorative effects.

## 7. Contribution Boundaries

Contributions are encouraged when they improve the implementation without compromising the visual identity.

### Contributors are encouraged to improve

- GTK styling and component consistency.
- Cinnamon desktop styling.
- Window decorations and controls.
- Icon design and icon coverage.
- Cursor and wallpaper integration.
- Accessibility and contrast.
- Desktop compatibility.
- Installer reliability and packaging.
- Documentation and testing.

### Changes requiring maintainer approval

The following decisions are reserved for the project maintainer:

- Changes to the core colour palette.
- Introduction of another accent colour.
- Changes to the responsibilities of red and gold.
- Replacement of the graphite foundation.
- Changes to the overall visual identity.
- Major changes to the project's design direction.

Suggestions are welcome, but implementation of these changes requires explicit maintainer approval.

## 8. Design Evolution

Stark Mint is not a frozen project.

Its implementation should continue improving through:

- Community feedback.
- Better component coverage.
- Accessibility improvements.
- Compatibility updates.
- Better icons and visual assets.
- Bug fixes and technical improvements.

The visual identity should remain stable while the quality of its implementation evolves.

## 9. Guiding Principle

**Improve the execution. Preserve the identity.**

Stark Mint should become more complete, consistent, accessible and reliable without losing what makes it recognisably Stark Mint.
