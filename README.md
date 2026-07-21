---
title: "csLaTeX"
aliases: "csLaTeX"
linter-yaml-title-alias: "csLaTeX"
date created: Thursday, May 14th 2026, 10:21:12 pm
date modified: 2026-07-21
---

<!-- @format -->

# csLaTeX

A collection of self-contained LaTeX packages for computer science research, teaching, and academic documents. Copy the required `.sty` file into a project and load it locally; no system-wide installation is needed.

## Packages

| Package                                       | Version | Description                                                                                                                               |
| --------------------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| [`codelines`](codelines/README.md)            | 1.1     | Algorithmic listing environment with automated line numbering and nesting.                                                                |
| [`csamsmath`](csamsmath/README.md)            | 3.2     | Math backbone for research papers: fonts, theorem environments, proof helpers, and annotation commands.                                   |
| [`csbook`](csbook/README.md)                  | 3.1     | Framework for textbooks and large reports with draft/final modes, theorem helpers, and broken-reference tracking.                         |
| [`csdeferproofs`](csdeferproofs/README.md)    | 1.3     | Deferred-proof infrastructure: collect proofs into a “Missing Proofs” appendix in submission mode; keep them inline in eprint mode.       |
| [`csextras`](csextras/README.md)              | 1.1     | Opt-in extension layer for `csamsmath` and `csbook`, including layout, metadata, boxes, indexing, and optional tooling.                   |
| [`eudoxus`](eudoxus/README.md)                | 1.2     | General-purpose math package: fonts, layout, theorem environments, TikZ, bibliography styling, and optional title/header patching.        |
| [`cslecture`](cslecture/README.md)            | 3.2     | Skeleton for lecture notes over the `article` class: condensed spacing, boxed title block, and a full theorem suite.                      |
| [`csletter`](csletter/README.md)              | 3.2     | Professional correspondence with configurable colors, margins, spacing, and optional logo and signature images.                           |
| [`cspresentation`](cspresentations/README.md) | 3.2     | Beamer theme overlay on Metropolis with the Nord color palette, semantic highlight commands, and TikZ diagram styles.                     |
| [`csresume`](csresume/README.md)              | 4.3     | Academic CV and resume with chronological entries, BibLaTeX publications, compact lists, and reference block layouts.                     |
| [`csthm`](csthm/README.md)                    | 3.2     | Theorem suite with three visual modes (`normal`, `fancy`, `oldschool`), dynamic accent colors, proof helpers, and `cleveref` integration. |
| [`cstufte`](cstufte/README.md)                | 3.1     | Tufte-style wide-margin layout with side-citations, marginalia, and a lattice cryptography notation library.                              |
| [`cswhitepaper`](cswhitepaper/README.md)      | 5.1     | Style for technical reports with per-author annotation commands, revision tracking, and ruled theorem aesthetics.                         |
| [`llncscrypto`](llncscrypto/README.md)        | 3.3.1   | LLNCS-compatible research-paper extensions: theorem support, author notes, boxes, captions, references, and preprint utilities.           |
| [`tcscrypto`](tcscrypto/README.md)            | 3.5     | Notation and environment library for TCS and cryptography: sampling, complexity, circuits, graphs, proof complexity, and protocol boxes.  |

## Installation

Copy the desired `.sty` file into your project directory alongside your main `.tex` file and load it in the preamble:

```latex
\usepackage{csamsmath}
\usepackage[fancy]{csthm}
\usepackage[appendix=true]{csdeferproofs}
```

No global installation or `texmf` tree manipulation required. Each package directory contains a `README.md` with full documentation, all options, the complete API, and caveats.

## Tests

Run the package smoke suite with `bash tests/run-smoke-tests.sh`. The suite compiles every package with LuaLaTeX and recompiles the packages that support pdfLaTeX with that engine; all output is written to a temporary directory and removed afterward.

## Language and Encoding Policy

csLaTeX packages do not select document languages. Packages that need Babel load it as `\RequirePackage{babel}` without language options; choose languages through the document class options or by loading `babel` explicitly before the csLaTeX package. Input encoding and font encoding are likewise document-level decisions.

## Typical Use Cases

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

## Repository Layout

```
csLaTeX/
├── codelines/          codelines.sty, README.md
├── csamsmath/          csamsmath.sty, README.md
├── csbook/             csbook.sty, README.md
├── csdeferproofs/      csdeferproofs.sty, README.md
├── csextras/           csextras.sty, README.md
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

## License

LaTeX Project Public License v1.3c.
