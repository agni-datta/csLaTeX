---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Sunday, April 12th 2026, 9:34:43 pm
date modified: Friday, May 1st 2026, 11:23:02 pm
---

## csletter

A professional LaTeX style package for formal correspondence, providing a refined protocol for letter formatting with customizable aesthetics and engine-aware font selection.

### Features

- **Formal Protocol**: Pre-configured layout for professional letters and correspondence.
- **Customizable Aesthetics**: Key-value options for colors, margins, and spacing.
- **Engine-Aware Fonts**: Automatically selects high-quality Garamond fonts for both pdfTeX and LuaTeX/XeTeX.
- **Integrated Assets**: Simple commands for logos and signatures.

### Installation & Usage

#### Loading the Package

```latex
\usepackage[options]{csletter}
```

#### Basic Example

```latex
\documentclass{article}
\usepackage[accentcolor=NavyBlue, header=true, signature=true]{csletter}

\begin{document}
\fromname{Agni Datta}
\today
...
\cslsignature
\end{document}
```

### Package Options

#### Styling

- `textcolor`: Primary text color (Default: `black`).
- `accentcolor`: Color for hyperlinks and highlights (Default: `blue`).
- `headercolor` / `footercolor`: Header and footer text colors.
- `linespacing`: `single`, `onehalf`, or `double`.

#### Margins

- `topmargin`, `bottommargin`, `leftmargin`, `rightmargin` (Values in cm).

#### Elements (Booleans)

- `header`, `footer`, `date`, `logo`, `signature`: Toggles specific components.
- `logofile`, `signaturefile`: Paths to the respective image files.

### API Reference

#### Assets

- `\csllogo`: Renders the logo if `logo=true` is set.
- `\cslsignature`: Renders the signature image if `signature=true` is set.

### Conflicts & Requirements

- **Graphics**: Requires external image files if `logo` or `signature` options are used.
- **Engine**: Optimized for LuaTeX but supports pdfTeX with font fallbacks.

### License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
