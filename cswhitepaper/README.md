---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:54 pm
date modified: Thursday, May 14th 2026, 10:24:28 pm
---

<!-- @format -->

## cswhitepaper

Style package for technical whitepapers and research reports with ruled theorem aesthetics and collaborative annotation tools.

### Usage

```latex
\usepackage[options]{cswhitepaper}
```

```latex
\documentclass{article}
\usepackage[draft]{cswhitepaper}
\documentaccentcolor{NavyBlue}

\begin{document}
\section{Abstract}
This is a new technical result.
\todo{Check citations here.}
\parhead{Methodology} We follow a standard approach.
\end{document}
```

### Options

- `draft`—(Default) enables annotations, revision highlights, and margin markers.
- `final`—suppresses all annotations for production output.

### API

#### Configuration

- `\documentaccentcolor{color}`—primary accent color for rules and headers.

#### Annotation commands (draft mode)

- `\todo{text}`, `\fixme{text}`, `\notes{text}`, `\query{text}`, `\missing{text}`.
- `\added{text}`, `\changed{text}`, `\removed{text}`—revision tracking.
- `\newguymarker{cmd}{label}{color}`—define custom participant markers.

#### Sectioning

- `\parhead{text}`—bold inline heading with automated punctuation.
- `\subparhead{text}`—small-caps inline heading with automated punctuation.

### Conflicts

- Do not load `amsthm` manually before this package.
- Optimized for `article` and `report` classes.

### License

LaTeX Project Public License v1.3c.
