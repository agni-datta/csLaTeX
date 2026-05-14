---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:12 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## csletter

Style package for formal correspondence with configurable colors, margins, and engine-aware Garamond font selection.

### Usage

```latex
\usepackage[options]{csletter}
```

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

### Options

#### Colors

- `textcolor`—primary text color (default: `black`).
- `accentcolor`—hyperlinks and highlights (default: `blue`).
- `headercolor` / `footercolor`—header and footer text colors.

#### Spacing

- `linespacing`—`single`, `onehalf`, or `double`.

#### Margins

- `topmargin`, `bottommargin`, `leftmargin`, `rightmargin`—values in cm.

#### Elements (booleans)

- `header`, `footer`, `date`, `logo`, `signature`—toggle each component.
- `logofile`, `signaturefile`—paths to image files.

### API

- `\csllogo`—renders the logo when `logo=true`.
- `\cslsignature`—renders the signature when `signature=true`.

### Conflicts

- `logo` and `signature` options require external image files.
- Optimized for LuaTeX; pdfTeX is supported with font fallbacks.

### License

LaTeX Project Public License v1.3c.
