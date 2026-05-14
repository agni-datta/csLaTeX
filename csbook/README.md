---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:45 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## csbook

Macro framework for textbooks, manuscripts, and reports. Handles sectioning typography, draft/final modes, and broken-reference tracking.

### Usage

```latex
\usepackage[options]{csbook}
```

```latex
\documentclass{book}
\usepackage[concrete, draft]{csbook}

\begin{document}
\chapter{Introduction}
\section{Motivation}
...
\end{document}
```

### Options

#### Fonts

`latinmodern`, `libertine`, `gfsdidot`, `concrete`, `palatino`, `kpfonts`, `baskervaldx`, `garamond`.

#### Mode

- `draft`—shows todos, fixmes, and margin annotations.
- `final`—(Default) suppresses all annotations.

### API

- `\parhead{text}`—punctuated inline paragraph heading.
- Redefines `\part`, `\chapter`, `\section`, etc. via `titlesec`.
- Patches `\@setref` to display undefined citations in the margins.

### Conflicts

- Requires a `\chapter`-supporting class (`book`, `report`).
- Overwrites `\tableofcontents`; avoid external TOC overrides.
- Uses `mdframed` internally; use `most` compatibility for nested `tcolorbox` layouts.

### License

LaTeX Project Public License v1.3c.
