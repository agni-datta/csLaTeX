---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:20 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## cspresentation

Beamer theme overlay built on Metropolis with the Nord color palette.

### Usage

```latex
\documentclass{beamer}
\usepackage{cspresentation}
```

```latex
\documentclass{beamer}
\usepackage{cspresentation}

\title{Modern TCS Research}
\author{Agni Datta}

\begin{document}
\maketitle
\begin{frame}{Introduction}
    \kw{Key word} highlighting in Nord colors.
\end{frame}
\end{document}
```

### Features

- Full 16-color Nord palette.
- Custom refinements on top of the Metropolis theme structure.
- Predefined TikZ styles for diagrams.
- Commands for citations, source attribution, and content reveals.

### API

#### Text styles

- `\kw{text}`—keyword highlight (Nord Frost).
- `\bad{text}`, `\good{text}`, `\warn{text}`—semantic color highlights.
- `\code{text}`—inline code.
- `\citeref{text}`—small-caps citation reference.

#### Layout

- `\source{text}`—source attribution pinned to the slide bottom.
- `\reveal{n}{text}`—reveal text on overlay $n$ with accent color.
- `\csrule`—colored horizontal rule.

#### TikZ styles

`mainnode`, `ideabox`, `keybox`—standardized styles for architectural and conceptual diagrams.

### Conflicts

- Requires `beamer` document class.
- Requires the Metropolis theme (`beamerthememetropolis`).

### License

LaTeX Project Public License v1.3c.
