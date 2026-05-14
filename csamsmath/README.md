---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:39 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## csamsmath

Math backbone for STEM publications: fonts, theorem environments, and collaborative annotations.

### Usage

```latex
\usepackage[options]{csamsmath}
```

```latex
\documentclass{report}
\usepackage[palatino, draft]{csamsmath}

\begin{document}
\begin{theorem}
    Mathematical content.
\end{theorem}
\end{document}
```

### Options

#### Fonts

- `latinmodern`—(Default) Modern Computer Modern.
- `libertine`—Stronger rendering weight.
- `gfsdidot`—GFS classical variants.
- `concrete`—Knuth Concrete, suitable for notes.
- `palatino`—TeX Gyre Pagella.
- `baskervaldx`—Baskervaldx.
- `kpfonts`—KP Fonts; requires LuaLaTeX (fallback warning on pdfLaTeX).

#### Mode

- `draft`—enables margin notes and annotation rendering.
- `final`—(Default) suppresses all annotations.

### API

#### Theorem-like environments

`theorem`, `lemma`, `corollary`, `proposition`, `conjecture`, `fact`, `claim`.

#### Definition & remark environments

`definition`, `notation`, `protocol`, `problem`, `construction`, `remark`, `note`, `example`, `observation`, `openproblem`.

#### Annotation commands (draft mode)

- `\todo{text}`, `\query{text}`, `\missing{text}`, `\notes{text}`.
- `\newguymarker{cmd}{label}{color}`—define a custom user marker.

### Conflicts

- Do not load `amsthm` manually before this package.
- Optimized for LuaLaTeX; pdfLaTeX is supported with fallback fonts.

### License

LaTeX Project Public License v1.3c.
