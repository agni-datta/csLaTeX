---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:45 pm
date modified: Tuesday, June 23rd 2026, 12:00:00 am
---

<!-- @format -->

## csbook

Macro framework for textbooks, manuscripts, and large reports. Handles font selection, sectioning typography (via `titlesec`), draft/final annotation modes, and a broken-reference tracking system that marks undefined `\ref` and `\cite` targets in the margin rather than silently printing “??”. Pairs with `csamsmath` for the math layer, but can be used standalone with any theorem package.

### Requirements

- Requires a document class that supports `\chapter`: use `book` or `report`. Loading with `article` will cause `titlesec` chapter formatting to fail.
- Do not load `amsthm` before this package.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `csbook`.

### Usage

```latex
\usepackage[options]{csbook}
```

### Minimal example

```latex
\documentclass{book}
\usepackage[palatino, draft]{csbook}

\begin{document}
\chapter{Introduction}
\section{Motivation}
Here is a broken reference: \cref{thm:doesnotexist}.
\end{document}
```

In `draft` mode the broken reference prints “??” in the text and a margin note indicating the undefined label. In `final` mode it prints “??” silently, as standard LaTeX does.

### Options

#### Font options (mutually exclusive)

- `latinmodern`: (default) Latin Modern.
- `libertine`: TeX Gyre Libertine with Libertinus Math.
- `gfsdidot`: GFS Didot.
- `concrete`: Knuth Concrete with Euler math.
- `palatino`: TeX Gyre Pagella.
- `kpfonts`: KP Fonts; requires LuaLaTeX.
- `baskervaldx`: Baskervaldx with newtxmath.
- `garamond`: TeX Gyre Termes.

#### Mode options

- `draft`: shows todos, fixmes, and margin annotations. Broken `\ref` and `\cite` targets are flagged in the margin.
- `final`: (default) suppresses all annotations and margin markers.

### API

#### Paragraph headings

- `\parhead{text}`: bold inline heading. Appends a period automatically unless `text` already ends with punctuation. Use in place of `\paragraph`.

#### Sectioning

`csbook` redefines `\part`, `\chapter`, `\section`, `\subsection`, `\subsubsection` via `titlesec` to apply consistent typographic spacing and font choices. Do not redefine these after loading the package.

#### Broken-reference tracking (draft mode)

`csbook` patches `\@setref` so that any `\ref`, `\cref`, or `\cite` that resolves to an undefined label prints a margin note naming the missing label. This is strictly a visual aid during writing: it has no effect on the compiled output in `final` mode.

#### Proof environments

`proofsketch`, `proofidea`, and `proofofclaim` are available as unnumbered proof-style environments when the theorem layer is active. `proofofclaim` accepts an optional claim identifier, rendered as “Proof of Claim (id)”. Use `csamsmath` alongside `csbook` for the full theorem and mathematics API.

`\setqedsymbol{symbol}` changes the proof-end symbol, and `\settheoremendsymbol{symbol}` changes theorem-end markers where those markers are used. The capitalized forms remain available as compatibility aliases.

#### Table of contents

`\tableofcontents` is patched for consistent formatting. Avoid overriding it with external TOC packages after loading `csbook`.

### Compatibility and conflicts

- Requires `book` or `report` class. Will silently misformat or error on `article` because `titlesec` chapter definitions reference `\chapter`.
- Uses `mdframed` internally for certain framed environments. If you also use `tcolorbox`, load it with the `most` library for compatibility: `\usepackage[most]{tcolorbox}`.
- Do not redefine `\tableofcontents` externally: the patched version handles `csbook`‘s own formatting.
- Font options must match between `csbook` and `csamsmath` if both are loaded. Load `csbook` first with the font option; `csamsmath` will detect and defer to it.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
