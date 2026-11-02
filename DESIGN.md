# Stark Mint — Design Principles

**Forged in graphite. Defined by red and gold.**

This document is the reference for how Stark Mint should look and why. If a contribution and this document disagree, this document wins.

It is split into two kinds of rules:

- **Design identity** — what makes Stark Mint recognisable. Changing it needs maintainer approval.
- **Implementation** — how the identity is built in CSS, SVG and XML. Contributors can improve this freely, as long as the identity survives.

Section 11 draws the line between the two in detail.

---

## 1. Project identity

Stark Mint is a Linux desktop theme inspired by the Iron Man Mark III armour and the Stark Industries aesthetic.

It should feel:

- Industrial and precise.
- Dark, clean and modern.
- Premium without being noisy.
- Readable and consistent before it is decorative.
- Recognisably Stark Mint across every component.

The identity is a dark graphite foundation with exactly two accent families: Stark Red and Metallic Gold.

Stark Mint is built on `Everforest-Green-Dark` from Everforest-GTK-Theme, modified and extended to carry its own identity.

**The goal is not to make everything look like Iron Man.** The goal is a coherent desktop theme inspired by Stark's visual identity. A desktop covered in red and gold would fail this test just as badly as one with no identity at all.

---

## 2. Core colour palette

These values are the ones actually used in the theme files. They match `preview/design-reference.png` and the table in `README.md`.

| Name | Hex | Role |
|---|---|---|
| Forge | `#0E0F11` | Deepest background: entries, rails, wells |
| Graphite | `#18191D` | Main background: views, panels |
| Surface | `#1F2126` | Raised surfaces: windows, cards |
| Charcoal | `#26282E` | Secondary surfaces: buttons, switch tracks |
| Border | `#343842` | Separators, outlines, hairlines |
| Silver | `#A5A9B2` | Secondary text, information, inactive labels |
| Bone | `#EBE8E2` | Primary text |
| Metallic Gold | `#D6A84E` | Focus, selection, primary actions, warnings |
| Stark Red | `#B3272D` | Identity, errors, destructive actions, close |

### Controlled variations

Lighter and darker shades are used for interaction states and hierarchy. They belong to the two existing accent families and do not count as new accents.

| Name | Hex | Use |
|---|---|---|
| Light Gold | `#E5BA63` | Gold hover, raised gold surfaces |
| Deep Gold | `#C4963F` | Gold pressed, visited links |
| Light Red | `#E05A60` | Red text on dark backgrounds, where solid red would be too dark to read |
| Error Red | `#C93037` | The `error_color` token; close button hover in window frames |
| Deep Red | `#8E1F24` | Red pressed |

Error Red exists because solid Stark Red does not reach a readable contrast ratio for small text and thin error marks on graphite. It is a legibility variant of Stark Red, not a separate accent.

Do not add new values to either table without maintainer approval. If an interaction state needs a shade that does not exist yet, open an issue rather than inventing one in a pull request.

---

## 3. Colour responsibilities

Each colour has one job. Keeping these jobs separate is what makes the theme readable.

### Metallic Gold — interaction

Gold tells the user what they can act on and what is currently active.

Use it for:

- Keyboard focus rings.
- Selected rows, tabs and items.
- Primary and suggested buttons.
- Active toggles, switches and checkboxes.
- Progress bars and sliders.
- Links.
- Hover and pressed states, where a state change needs to be visible.
- Warnings.

Gold should make interactive elements obvious. It should not coat whole surfaces.

### Stark Red — identity and danger

Red carries the project's identity and marks actions the user cannot undo.

Use it for:

- Branding and identity details.
- Close controls.
- Destructive actions.
- Error states and error text.
- Serious alerts.

Red is deliberate and sparing. If red appears on something that is neither identity nor danger, that is a bug.

### Graphite and neutrals — the foundation

The neutral range does the bulk of the work and should stay visually dominant.

It covers:

- Application and desktop backgrounds.
- Panels, menus and popovers.
- Cards and secondary surfaces.
- Borders and separators.
- Primary and secondary text.
- Disabled elements.

If you removed every accent colour, the theme should still be a usable, coherent dark desktop.

---

## 4. Design restrictions

### Accent families that must not be introduced

These must never become theme accents:

- Cyan
- Turquoise
- Teal
- Blue
- Green
- Purple
- Any other competing accent family

This applies to theme styling. Two things are **not** covered by it:

1. **Third-party application icons.** Their own colours may stay. A recognisable icon is more useful than a uniform palette. Do not recolour every application icon red or gold.
2. **Application content.** Images, web pages, documents and media inside an application follow the application, not the theme.

Named colour lists inherited from upstream (for example `blue_1`–`blue_5`) exist so that an application asking for "blue" by name gets blue. No theme rule references them. They are compatibility shims, not accents, and should be left alone.

### Visual restrictions

Avoid:

- Glow effects.
- Gradients with no functional purpose.
- Heavy borders and outlines stacked on each other.
- Decoration that makes a control harder to read.
- Low-contrast text.
- Visual noise generally.

---

## 5. Typography and readability

Stark Mint uses three families, bundled under `fonts/`.

| Family | Role |
|---|---|
| Barlow | Interface text, menus, labels, body copy |
| Barlow Semi Condensed SemiBold | Title bars, section headings, menu titles |
| JetBrains Mono | Terminals, file sizes, timestamps, clock |

Principles:

- Barlow is the default. Do not introduce a fourth family for a single component.
- Use weight and size for hierarchy before you reach for colour.
- Barlow Semi Condensed is for chrome, not body text. It is narrower and tires the eye over long passages.
- Monospace is for data that lines up in columns, not for emphasis.
- Never put text below the readable contrast ratios in section 10 just to get a visual effect.
- Do not hard-code font sizes where the desktop's own font scaling should apply. Users change their interface font size and the theme must survive it.

---

## 6. Interaction states

Every interactive element needs four distinguishable states. Missing or ambiguous states are the most common bug in a theme.

| State | Treatment |
|---|---|
| Normal | Neutral surface, neutral text, no accent |
| Hover | A clear but quiet change — a lighter surface, or gold where the element is a primary action |
| Focus | Gold. Keyboard focus must always be visible, including on elements reached only by Tab |
| Active / pressed | A deeper shade of the state colour — Deep Gold or Deep Red |
| Selected | Gold |
| Disabled | Reduced contrast neutral. Must read as unavailable, not merely as dim |
| Error | Error Red |
| Backdrop | The window is unfocused. Accents fade; the layout does not move |

Two rules that are easy to get wrong:

- A state must never be signalled by colour alone where that colour is the only cue. Shape, border or background weight should back it up.
- Hover and focus are different things. A mouse hover is not keyboard focus, and styling one must not remove the other.

---

## 7. GTK styling principles

Stark Mint styles GTK 2, GTK 3 and GTK 4.

- **Build on upstream, do not fork it mentally.** Most of the GTK CSS comes from Everforest-GTK-Theme. Stark Mint's own rules sit in a clearly marked override block at the end of each stylesheet. Keep new overrides there so the next upstream refresh is possible.
- **Prefer the narrowest selector that works.** A rule that targets every `button` will reach buttons you have never seen.
- **Change colour, not geometry,** unless geometry is the actual problem. Padding and sizing changes ripple through applications in ways that are hard to test.
- **Keep GTK 3 and GTK 4 consistent.** A dialog should not look different depending on which toolkit an application uses.
- **GTK 2 is legacy but still shipped.** It uses the Adwaita and pixmap engines and PNG assets rather than CSS. Changes here need the matching assets regenerated, not just a colour swap.
- **Do not leave parser errors behind.** Run the stylesheet through the GTK parser before submitting.
- Corner radii are square-leaning by design. This is part of the industrial feel, not an accident.

---

## 8. Cinnamon desktop styling

Cinnamon is the primary target and should receive the most attention.

- The panel is graphite and reads as part of the desktop, not as a floating widget.
- Menu and applet selection is gold.
- Notifications use neutral graphite cards. Gold indicates a normal or confirming notification, red a security or error notification.
- OSD levels (volume, brightness) and the current date use gold.
- Dialogs follow the same split as everything else: gold confirms, red destroys.
- Cinnamon class names change between releases. When you add a selector, state which Cinnamon version you checked it against. Do not delete a selector for an older version just because your version does not use it.

---

## 9. Window decorations and controls

Stark Mint ships Metacity/Muffin frames, Xfwm decorations with HiDPI variants, and CSD header bar styling in GTK.

### Current implemented behaviour

| Control | Normal | Hover | Pressed |
|---|---|---|---|
| Close (CSD header bar) | Dark red well, Light Red glyph | Solid Stark Red, white glyph | — |
| Close (Metacity frame) | Stark Red on a dark red field | Error Red | Deep Red |
| Minimize, maximize (CSD) | Neutral translucent bone | Neutral bone tint | Neutral, slightly stronger |
| Minimize, maximize (Metacity) | Title colour at low opacity | Title colour, higher opacity | Title colour, higher still |

### Intended direction

The agreed target is:

| Control | Normal | Hover |
|---|---|---|
| Close | Stark Red | **Stark Red** — stays red |
| Minimize | Stark Red | **Metallic Gold** |
| Maximize | Stark Red | **Metallic Gold** |

Close keeps its red identity through every state. It is the one control where an accidental click costs the user work, so it should never share a hover colour with the two harmless controls next to it. Minimize and maximize move to gold, because gold is the theme's interaction colour and that is exactly what a hover is.

**This is not implemented yet.** Minimize and maximize are currently neutral in both CSD and Metacity. Close already behaves correctly: it is red by default and deepens to Error Red or solid Stark Red on hover.

So the open work is narrow — give minimize and maximize a red default and a gold hover. Leave close alone.

A contributor is welcome to take it on. If you do:

- Change CSD and Metacity together, plus the Xfwm PNG assets and both HiDPI variants. A control that behaves one way in a GTK application and another in a legacy window is worse than one that is consistently neutral.
- Keep close visually distinct from the other two at every state. Position and glyph do most of that work, and the hover split reinforces it.
- Check that a red default on three controls does not make the title bar louder than the window content. If it does, the red should be a restrained well rather than a solid fill.
- Update the table above and the one before it in the same pull request.

### General rules for decorations

- Borders are thin and neutral. The frame should not compete with the window content.
- Active and inactive windows must be clearly distinguishable.
- No glow, no decorative gradient on frames.
- The button layout in `index.theme` is `close,minimize,maximize:menu`. Changing it is a design decision, not an implementation one.

---

## 10. Accessibility and contrast

Accessibility is part of the design, not a later addition.

Expectations:

- Normal body text should reach a contrast ratio of at least **4.5:1** against its background.
- Large text and non-text interface indicators should reach at least **3:1**.
- Keyboard focus must be visible on every focusable element.
- Disabled elements should be clearly disabled while still being legible enough to read.
- No state should be communicated by hue alone.

Measured ratios for the current palette are recorded in `COLOUR-REPORT.md`. A few examples: gold on graphite reaches 8.00, Silver on graphite 7.46, Bone on graphite 14.36.

If a contribution improves contrast, it is welcome even if it slightly changes a shade — as long as the shade stays inside the red or gold family and the change is explained in the pull request.

---

## 11. Design identity versus implementation

This is the distinction that matters most for contributors.

### Design identity — maintainer approval required

These define what Stark Mint *is*:

- The core palette values and the controlled variations.
- The two-accent system itself.
- What red means and what gold means.
- Graphite as the neutral foundation.
- The restriction on other accent families.
- The typographic families.
- The overall industrial, dark direction.
- The window control colour scheme.

If you want to change any of these, open a GitHub Issue or Discussion first and explain the problem you are solving. Do not open a pull request that changes them as a side effect of something else.

### Implementation — contribute freely

These are how the identity gets built, and they are open:

- Any CSS, SVG, XML, gtkrc or asset that applies the existing palette.
- Fixing a component that uses the wrong colour for its role.
- Adding missing selectors or missing states.
- Supporting a new desktop version.
- Improving contrast within the existing families.
- Removing dead or unreachable rules.
- Adding icons.
- Styling for an individual application, kept optional and modular.
- Installer, packaging, documentation and screenshots.

A good rule of thumb: if your change could be described as *"Stark Mint now does this correctly"*, it is implementation. If it would be described as *"Stark Mint now looks different"*, it is identity.

---

## 12. Application-specific styling

The theme already carries styling for Nautilus, Nemo, gedit, terminal applications and a few browser window types, most of it inherited from upstream.

New application styling is welcome under three conditions:

1. **Optional.** The core theme must look correct without it.
2. **Modular.** Keep it in its own clearly marked block or file so it can be reviewed and removed independently.
3. **Not a dependency.** Styling for a music player must never become something the desktop theme requires.

Follow the same colour responsibilities. An application theme is Stark Mint applied to that application, not a new design.

---

## 13. Icon design direction

Stark Mint does not ship an icon theme yet. `index.theme` points at `Tela-circle-Dark`, which is not bundled. A Stark Mint icon set is one of the most valuable contributions available.

Direction for anyone taking it on:

- Graphite, Silver and Bone carry the shapes. Red and gold are for accents and identity marks, not fills.
- Folder icons are the highest-value starting point, since they are everywhere in a file manager.
- Symbolic icons should be monochrome and follow the text colour, not the accents.
- **Do not recolour third-party application icons.** An application's icon is how users find it.
- Geometry should be squarer and more technical than rounded and friendly, in line with the rest of the theme.
- Legibility at 16px matters more than detail at 256px.

Start with a proposal in an issue before drawing a full set, so the direction can be agreed early.

---

## 14. Design evolution

Stark Mint is not frozen.

The implementation should keep improving through better component coverage, accessibility work, compatibility fixes, better assets and bug fixes.

The identity should stay stable while the quality of its execution rises.

---

## 15. Guiding principle

**Improve the execution. Preserve the identity.**

Stark Mint should become more complete, more consistent, more accessible and more reliable without losing what makes it recognisably Stark Mint.
