---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Sunday, April 12th 2026, 9:36:12 pm
date modified: Friday, May 1st 2026, 11:23:03 pm
---

## llncscrypto

A robust cryptographic layer specifically designed to integrate with the Springer LLNCS framework, bridging the gap between standard LLNCS theorem logic and modern cryptographic document requirements.

### Features

- **LLNCS Integration**: Strictly maps Springer theorem logic onto modern commands without breakage.
- **Preprint Support**: Custom `preprint` mode for generating eprints with proper geometries and headers.
- **Collaborative Notes**: Advanced system for author notes (`\dtnote`), missing content flags, and marginalia.
- **Automated Punctuation**: Integrated system for sectioning and theorem headers.

### Installation & Usage

#### Loading the Package

```latex
\usepackage[options]{llncscrypto}
```

#### Basic Example

```latex
\documentclass{llncs}
\usepackage[crypto, preprint, theorems]{llncscrypto}

\begin{document}
\title{Lattice-based Aggregation}
\author{Agni Datta}
\maketitle
\begin{theorem}
    Security holds under LWE.
\end{theorem}
\end{document}
```

### Package Options

#### Modes

- `preprint`: Sets up a custom 11pt eprint layout with centered page numbers.
- `draft`: Enables draft markers and datetime stamps on the footer.
- `final`: (Default) Suppresses all draft markers and notes for camera-ready output.

#### Features (Booleans)

- `crypto`: Loads the `tcscrypto` package and `orcidlink`.
- `theorems`: Wraps LLNCS native theorem parsing in a standardized configuration.
- `tikz`: Loads PGF/TikZ with common cryptographic drawing libraries.
- `libertine`: Activates the Libertine font suite for improved readability.
- `appendix`: Cleanly shifts proof formatting to match LLNCS appendix styles.

### API Reference

#### Annotation Commands

- `\dtnote[author]{text}`: Color-coded author note with a sidebar marker.
- `\missing{text}`: Flags missing content in red and adds it to a global list.
- `\printdtnotes` / `\printmissing`: Generates summary sections for notes and missing items.

#### Layout Tools

- `\parhead{text}`: Bold inline heading with automated punctuation.
- `\nestedbar`: Environment for vertical demarcation of logical blocks.

### Conflicts & Requirements

- **llncs**: This package *must* be used within an LLNCS document class environment.
- **amsthm**: Do not load `amsthm` externally; Springer handles these, and we interface with their system.

### License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
