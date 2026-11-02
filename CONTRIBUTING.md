# Contributing to Stark Mint

Thank you for considering a contribution.

Stark Mint is an open-source desktop theme inspired by the Iron Man Mark III armour and the Stark Industries aesthetic. It is a small project and it needs help in a lot of areas.

**Contributions are not limited to fixing bugs.** New icons, new application styling, better Cinnamon coverage, accessibility work and screenshots are all genuinely wanted.

You do not need to be an expert. A clear bug report or a single improved icon is a real contribution.

---

## Contents

- [Before you start](#before-you-start)
- [Where help is needed](#where-help-is-needed)
- [Design rules](#design-rules)
- [Reporting a bug](#reporting-a-bug)
- [Suggesting an idea](#suggesting-an-idea)
- [The contribution workflow](#the-contribution-workflow)
- [Testing your change](#testing-your-change)
- [Pull request expectations](#pull-request-expectations)
- [Licensing and attribution](#licensing-and-attribution)
- [How contributions are reviewed](#how-contributions-are-reviewed)

---

## Before you start

Please read:

- [README.md](README.md) — what the project is and how to install it.
- [DESIGN.md](DESIGN.md) — the visual identity and the rules that protect it.
- [CREDITS.md](CREDITS.md) — attribution and third-party licences.

`DESIGN.md` matters most. Every visual contribution has to follow it. Section 11 of that document explains which parts of the design you can change freely and which parts need to be discussed first.

---

## Where help is needed

### A. File and folder icons

Stark Mint has **no icon theme of its own**. It currently points at `Tela-circle-Dark`, which users install separately. Building a Stark Mint icon set is probably the single most valuable thing anyone could contribute.

Open areas:

- A Stark Mint icon pack, started from folder icons.
- Better folder icons.
- Application and symbolic icons.
- Consistency and quality across an existing set.

Follow the red, gold and graphite identity, but **do not recolour third-party application icons**. An application's icon is how people find it. Section 13 of `DESIGN.md` has the full direction.

If you are taking on something as large as a full icon set, open an issue first so the direction can be agreed before you draw a hundred icons.

### B. GTK application styling

- GTK 3 and GTK 4 refinement.
- Buttons, menus, dialogs, switches, input fields, scrollbars, popovers, headerbars.
- Visual inconsistencies between GTK 3 and GTK 4.
- Compatibility fixes for specific GTK versions.
- Removing dead or unreachable rules inherited from upstream.

Stark Mint's own rules live in a marked override block at the end of each stylesheet. Keep new overrides there.

### C. Application-specific themes

You are welcome to propose and build styling for individual applications:

- Music players.
- File managers.
- Terminals.
- Text editors.
- Media players.
- Any other GTK application.

For example, a Stark Mint music player theme would be a welcome contribution.

Three conditions:

1. **Optional.** The core theme must look right without it.
2. **Modular.** Keep it in its own clearly marked block or file so it can be reviewed, updated or removed on its own.
3. **Never a dependency.** An application theme must not become something the desktop theme requires.

### D. Cinnamon desktop

Cinnamon is the primary target and it gets the most use.

- Panel and menu styling.
- Desktop components.
- Notifications, OSD and applets.
- Any Cinnamon-specific UI improvement.

Cinnamon class names change between releases. Say which Cinnamon version you tested against, and do not remove a selector for an older version just because your version does not use it.

### E. Window decorations

- Metacity and Muffin styling.
- Xfwm decorations, including the HiDPI and extra-HiDPI variants.
- Window borders and title bars.
- Minimize, maximize and close controls.
- Hover, active, focus and backdrop states.

Section 9 of `DESIGN.md` records the current behaviour of the window controls and the direction the maintainer wants them to move in. The two do not currently match, and closing that gap is an open task.

If you change a window control, change it everywhere — CSD header bars, Metacity frames and the Xfwm assets, including both HiDPI variants. A control that behaves differently in a GTK application than in a legacy window is worse than one that is consistently plain.

### F. Documentation, testing and maintenance

Often the most useful and most overlooked work:

- Installation improvements.
- Bug fixes.
- **Compatibility testing.** Most components have been checked in the files but not confirmed on a real running desktop. If you run Stark Mint on a desktop that is not listed as tested in the README, saying so is a real contribution.
- **Screenshots.** The project needs real screenshots of a running Cinnamon desktop, the file manager and the application menu.
- Documentation fixes.
- Accessibility improvements.

---

## Design rules

Every contribution must follow `DESIGN.md`.

### You are free to

- Improve existing styling.
- Add icons.
- Build optional application themes.
- Improve GTK compatibility.
- Refine desktop components.
- Improve accessibility and contrast.
- Suggest new ideas and visual improvements.
- Fix anything that uses the wrong colour for its role.

### You must not do these independently

- Introduce an unrelated accent colour — cyan, turquoise, teal, blue, green or purple.
- Replace the red-and-gold identity.
- Change the fundamental design direction.
- Add glow, decorative gradients or other unnecessary effects.
- Trade readability for appearance.
- Recolour third-party application icons.

These are not off-limits forever. They are off-limits as a surprise inside a pull request. If you think the design should change, **open a GitHub Issue or Discussion first** and explain the problem you are trying to solve. A good argument will be heard.

### The short version

Graphite and the neutrals are the foundation. Gold means interaction. Red means identity and danger. Readability wins over appearance.

---

## Reporting a bug

Open a GitHub Issue. Please check existing issues first so you are not filing a duplicate.

Include as much of this as you can:

- Linux distribution and version.
- Desktop environment and version — for example, Cinnamon 6.4.13.
- GTK version, if relevant.
- Which theme component is affected.
- Steps to reproduce.
- What you expected.
- What actually happened.
- A screenshot, if the problem is visual.

A screenshot is worth a lot for a theme bug.

---

## Suggesting an idea

Ideas are welcome. When you propose one, explain:

1. What problem it solves.
2. Which component it affects.
3. How it improves usability, consistency or appearance.
4. Whether it fits the principles in `DESIGN.md`.

Not every suggestion will be implemented, but a well-explained one is always worth reading.

Anything that touches the core design identity needs to be discussed before it is built.

---

## The contribution workflow

All external contributions go through pull requests. **Direct commits and pushes to the protected `main` branch are not part of the workflow.**

1. **Fork** the repository on GitHub.
2. **Clone** your fork locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/stark-mint-theme.git
   cd stark-mint-theme
   ```
3. **Create a branch** for your work. One branch per feature or fix:
   ```bash
   git checkout -b fix/cinnamon-menu-contrast
   ```
4. **Make focused changes.** Keep the pull request to one feature or one issue. If you notice something else while you are in there, note it in an issue rather than folding it into the same branch.
5. **Test your changes** on a real desktop. See [Testing your change](#testing-your-change).
6. **Commit** with a clear message that says what changed and why:
   ```bash
   git commit -m "cinnamon: raise menu selection contrast to 4.6:1"
   ```
7. **Push** your branch to your fork:
   ```bash
   git push origin fix/cinnamon-menu-contrast
   ```
8. **Open a Pull Request** against the `main` branch of the Stark Mint repository.
9. **Describe** what changed, why it changed, and how you tested it.
10. **Include screenshots** for anything visual.

Small, focused pull requests get reviewed faster and are far more likely to be merged than large ones that touch many things at once.

---

## Testing your change

Test on a real desktop before you submit. "It looked right in the CSS" is not testing.

For a visual change:

- Take before-and-after screenshots.
- Say which desktop environment and version you used.
- Say which components you checked.
- Check the normal, hover, focus and active states — not just the normal one.
- Check that text and controls are still readable.
- Check an unfocused window too, if the change touches window chrome.

For a GTK stylesheet change, run the stylesheet through the GTK parser and confirm you have not added new errors.

**Do not claim compatibility with a desktop version you have not actually run.** An honest "tested only on Mint 22 / Cinnamon 6.4" is much more useful than an optimistic claim nobody can rely on.

---

## Pull request expectations

Every pull request should have:

- **A clear title** that says what it does.
- **A description** of the problem or the feature.
- **The files and components affected.**
- **The testing you performed**, including your desktop environment and version.
- **Screenshots** for visual changes.
- **Attribution and licensing information** for any third-party asset you are introducing.
- **Any known limitations** of your change.

If your pull request changes behaviour that `DESIGN.md` or `README.md` documents, update that document in the same pull request.

---

## Licensing and attribution

Please:

- Only submit work you have the right to distribute.
- Preserve existing copyright notices. Do not delete an author line to tidy a file up.
- Preserve upstream licence headers, including the LGPL 2.1 header in `gnome-shell.css`.
- Identify every third-party asset you introduce, with its source, author and licence, and add it to `CREDITS.md`.
- Do not submit assets whose redistribution rights are unclear. If you cannot establish where something came from, leave it out.

By submitting a contribution, you agree it may be distributed under the licence or licences that apply to the files you are modifying.

Most of the theme is GPL-3.0, as a modified version of Everforest-GTK-Theme. A few components carry their own licences. `CREDITS.md` has the breakdown — including one open question about the licence for the project's original files, which the maintainer still needs to settle.

If you are unsure about the licensing of something, ask in an issue before you submit it.

---

## How contributions are reviewed

The maintainer reviews pull requests for technical correctness, compatibility, licensing and consistency with `DESIGN.md`.

The maintainer may:

- Ask for changes.
- Ask you to split unrelated changes into separate pull requests.
- Decline a contribution that conflicts with the project's identity or direction.

If a pull request is declined, it is usually about fit rather than quality. Asking first through an issue is the best way to avoid spending effort on something that will not be merged.

---

Stark Mint should grow through community work. New ideas, technical improvements and honest criticism are all welcome.

Contributions should expand Stark Mint, not turn it into a collection of unrelated themes.

**Improve the execution. Preserve the identity.**

Thank you for helping.
