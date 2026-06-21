---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:12 pm
date modified: Tuesday, May 19th 2026, 1:35:33 am
---

<!-- @format -->

## csLaTeX

LaTeX packages for computer science research, technical teaching, and academic document preparation. Each package is self-contained: copy a single `.sty` file into your project and load it. No installation required.

**Author:** Agni Datta ([agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX))

### Packages

| Package                                       | Version | Description                                                                                                                              |
| --------------------------------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| [`codelines`](codelines/README.md)            | 1.0     | Algorithmic listing environment with automated line numbering and nesting.                                                               |
| [`csamsmath`](csamsmath/README.md)            | 3.1     | Math backbone for research papers: fonts, theorem environments, and annotation commands.                                                 |
| [`csbook`](csbook/README.md)                  | 3.0     | Framework for textbooks and large reports with draft/final modes and broken-reference tracking.                                          |
| [`csdeferproofs`](csdeferproofs/README.md)    | 1.0     | Deferred-proof infrastructure: collect proofs into a “Missing Proofs” appendix in submission mode; keep them inline in eprint mode.      |
| [`eudoxus`](eudoxus/README.md)                | 1.0     | General-purpose math package: fonts, layout, theorem environments, TikZ, and bibliography styling for `amsart` documents.                |
| [`cslecture`](cslecture/README.md)            | 3.0     | Skeleton for lecture notes over the `article` class: condensed spacing, boxed title block, and a full theorem suite.                     |
| [`csletter`](csletter/README.md)              | 3.0     | Professional correspondence with configurable colors, margins, spacing, and optional logo and signature images.                          |
| [`cspresentation`](cspresentations/README.md) | 3.0     | Beamer theme overlay on Metropolis with the Nord color palette, semantic highlight commands, and TikZ diagram styles.                    |
| [`csresume`](csresume/README.md)              | 4.2     | Academic CV and resume with chronological entries, BibLaTeX publications, compact lists, and reference block layouts.                   |
| [`csthm`](csthm/README.md)                    | 3.0     | Theorem suite with three visual modes (`normal`, `fancy`, `oldschool`), dynamic accent colors, and full `cleveref` integration.          |
| [`cstufte`](cstufte/README.md)                | 3.0     | Tufte-style wide-margin layout with side-citations, marginalia, and a lattice cryptography notation library.                             |
| [`cswhitepaper`](cswhitepaper/README.md)      | 5.0     | Style for technical reports with per-author annotation commands, revision tracking, and ruled theorem aesthetics.                        |
| [`llncscrypto`](llncscrypto/README.md)        | 3.2     | LLNCS-compatible research-paper extensions: theorem support, author notes, boxes, captions, references, and preprint utilities.           |
| [`tcscrypto`](tcscrypto/README.md)            | 3.3     | Notation and environment library for TCS and cryptography: sampling, complexity, circuits, graphs, proof complexity, and protocol boxes. |

### Installation

Copy the desired `.sty` file into your project directory alongside your main `.tex` file and load it in the preamble:

```latex
\usepackage{csamsmath}
\usepackage[fancy]{csthm}
\usepackage[appendix=true]{csdeferproofs}
```

No global installation or `texmf` tree manipulation required. Each package directory contains a `README.md` with full documentation, all options, the complete API, and caveats.

### Typical use cases

**Conference paper (LLNCS):**

```latex
\documentclass[runningheads, a4paper, envcountsect]{llncs}
\usepackage[captions, draft, theorems]{llncscrypto}
\usepackage{tcscrypto}
\usepackage{tikz}
\usepackage[appendix=true]{csdeferproofs}
\NewDeferredThm{theoremE}{theorem}
\NewDeferredThm{lemmaE}{lemma}
```

**Lecture notes:**

```latex
\documentclass[12pt]{article}
\usepackage{cslecture}
\course{Computational Complexity}
\lecturer{Agni Datta}
```

**Research monograph:**

```latex
\documentclass{book}
\usepackage[palatino, draft]{csbook}
\usepackage[palatino, draft]{csamsmath}
```

**Standalone theorem package (any class):**

```latex
\usepackage{hyperref}   % must come before csthm
\usepackage[fancy]{csthm}
\SetAccentColor{RoyalBlue}
```

### Repository layout

```
csLaTeX/
├── codelines/          codelines.sty, README.md
├── csamsmath/          csamsmath.sty, README.md
├── csbook/             csbook.sty, README.md
├── csdeferproofs/      csdeferproofs.sty, README.md
├── eudoxus/            eudoxus.sty, README.md
├── cslecture/          cslecture.sty, README.md
├── csletter/           csletter.sty, README.md
├── cspresentations/    cspresentation.sty, README.md
├── csresume/           csresume.sty, README.md
├── csthm/              csthm.sty, README.md
├── cstufte/            cstufte.sty, README.md
├── cswhitepaper/       cswhitepaper.sty, README.md
├── llncscrypto/        llncscrypto.sty, README.md
├── tcscrypto/          tcscrypto.sty, README.md
├── CONTRIBUTION.md     Contribution guidelines
├── LICENSE             LPPL v1.3c
└── latexmkrc           Repository-wide build configuration
```

### License

LaTeX Project Public License v1.3c.
