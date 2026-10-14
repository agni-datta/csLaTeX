---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Monday, October 12th 2026, 12:22:57 am
date modified: Wednesday, October 14th 2026, 3:27:55 am
---

<!-- @format -->

## cslecture 4.0.1

One lecture framework for individual notes, course books and scribe notes. It uses [csmath](../csmath/README.md) for fonts and [csthm](../csthm/README.md) for theorems. By default, fonts come from the document class and theorems use the unframed `oldschool` style.

Copy `cslecture.sty`, `csmath.sty` and `csthm.sty` into a vendored project. Optional features require their ordinary TeX distribution packages. LaTeX 2022-06-01 or newer, pdfLaTeX and LuaLaTeX are supported. csmath deliberately rejects XeLaTeX; optional zref-clever has its own newer kernel requirement.

### Examples

```latex
\documentclass[11pt]{article}
\usepackage[mode=single]{cslecture}
\course{Computational Complexity}
\lecturer{Course Instructor}
\begin{document}
\maketitle
\section{Circuit Complexity}
\begin{theorem}Every finite circuit has a finite description.\end{theorem}
\begin{proof}List its gates and wires.\end{proof}
\end{document}
```

```latex
\documentclass[11pt,twoside]{book}
\usepackage[mode=series,index,solution=proof]{cslecture}
\coursetitle{Introduction to Algorithms}
\author{Course Instructor}
\begin{document}
\maketitle
\frontmatter\tableofcontents
\mainmatter\chapter{Asymptotic Analysis}
An \emphindex{invariant} is maintained.
\begin{exercise}Verify the base case.\end{exercise}
\begin{solution}The initial value satisfies the assertion.\end{solution}
\backmatter\printindex
\end{document}
```

Run `makeindex` explicitly when building an index; automatic external execution is disabled.

```latex
\documentclass[11pt]{article}
\usepackage[mode=scribe,references=cleveref,solution=proof]{cslecture}
\course{Cryptographic Protocol Theory}
\lecturer{Course Instructor}
\scribe{Student Name}
\lecturenumber{7}
\lecturetitle{Secure Computation}
\lecturedate{October 2026}
\lectureterm{Autumn 2026}
\lectureinstitution{University}
\begin{document}
\maketitle
\section{Preliminaries}
\begin{definition}\label{state}A state is a finite vector.\end{definition}
See \cref{state}.
\end{document}
```

### Options and defaults

Identical repeated selections are harmless; contradictory or unknown selections give errors. Select fonts, theorem settings, and optional presentation features explicitly.

| Key                | Values                                                                                                          | Default                                                         |
| ------------------ | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `mode`             | `single`, `series`, `scribe`                                                                                    | `single`                                                        |
| `font`             | `inherit`, `baskervaldx`, `concrete`, `garamond`, `gfsdidot`, `kpfonts`, `latinmodern`, `libertine`, `palatino` | `inherit`; inherit preloaded csmath when omitted                |
| `font-policy`      | `compatible`, `strict`                                                                                          | csmath default `compatible`                                     |
| `theorems`         | `oldschool`, `normal`, `fancy`, `none`, `inherit`                                                               | csmath default `oldschool`; inherit preloaded provider          |
| `numberwithin`     | `section`, `chapter`, `none`                                                                                    | section for single/scribe, chapter for series                   |
| `equations`        | `inherit`, `section`, `chapter`, `none`                                                                         | `inherit`                                                       |
| `counters`         | `independent`, `shared`                                                                                         | `independent`                                                   |
| `families`         | `standard`, `extended`                                                                                          | `standard`                                                      |
| `solution`         | `theorem`, `proof`                                                                                              | `theorem`; numbered family requires extended families           |
| `family-style`     | csthm group style keys                                                                                          | inherited csthm styles                                          |
| `paragraphs`       | `runin`, `inherit`                                                                                              | csmath default `runin`                                          |
| `title`            | `lecture`, `boxed`, `course`, `scribe`, `inherit`                                                               | lecture/scribe/course according to mode                         |
| `chapters`         | `native`, `boxed`                                                                                               | `native`                                                        |
| `headers`          | `inherit`, `course`                                                                                             | `inherit`                                                       |
| `references`       | `none`, `hyperref`, `cleveref`, `zref`, `both`                                                                  | `none`; bare option means cleveref                              |
| `scribe`           | Boolean                                                                                                         | false; selects a compact title unless another title is selected |
| `draft`, `final`   | draft Boolean / bare final                                                                                      | final; draft enables annotations                                |
| Feature keys below | Boolean, bare means true                                                                                        | false                                                           |

Single/scribe use article mathematics; series uses book mathematics and requires chapters. Article/book/report, AMS and KOMA equivalents are accepted. A chapter class must use `mode=series`; add `scribe` or use `\makelecturetitle` for an included scribe lecture. Publisher classes, including LNCS and Beamer, are rejected. No publisher formatting is changed. Explicit `theorems=none` or `inherit` leaves theorem ownership disabled/inherited; do not request proof-style solutions or extended declarations without an owning provider.

### Optional features

| Feature                     | Provider and packages                                                                                                                                           |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Minimal                     | csmath mathematical core, csthm oldschool, amsmath/mathtools, symbols appropriate to the font, enumitem and xcolor with csthm’s retained color-table facilities |
| `table`                     | csmath: array, booktabs, tabularx, longtable, multirow, makecell, threeparttable, tabularray (and its libraries)                                                |
| `caption`                   | csmath: caption, subcaption                                                                                                                                     |
| `float`                     | csmath: floatrow                                                                                                                                                |
| `graphics`                  | csmath: graphicx, adjustbox                                                                                                                                     |
| `lists`                     | csmath: enumitem, paralist; compact list conventions                                                                                                            |
| `boxes`                     | csmath: framed and `nestedbar`                                                                                                                                  |
| `quotes`                    | csmath: csquotes, dirtytalk, soul, xspace, ulem                                                                                                                 |
| `annotations`               | csmath: xcolor, marginnote, ulem                                                                                                                                |
| `microtype`                 | csmath: microtype                                                                                                                                               |
| `index`                     | csmath: imakeidx with `noautomatic`                                                                                                                             |
| `layout`                    | lecture-specific geometry (one-inch margins), setspace                                                                                                          |
| `diagrams`                  | tikz-cd and its TikZ dependencies                                                                                                                               |
| `chapters=boxed`            | titlesec; chapter boxes use ordinary LaTeX framing                                                                                                              |
| `headers=course`            | fancyhdr; page numbers, chapter and course running heads                                                                                                        |
| enhanced references         | hyperref/nameref, plus cleveref and/or zref-clever as selected                                                                                                  |
| `theorems=normal` / `fancy` | csthm: mdframed with TikZ                                                                                                                                       |

These are direct feature groups, not exhaustive transitive package lists. The minimal profile does not load indexing, professional tables, captions, geometry, titlesec, hyperref, TikZ or mdframed. csthm’s retained xcolor contract includes array/colortbl; mathtools also brings graphicx during document initialization.

### Metadata and titles

`\course{…}`, `\coursetitle{…}`, `\lecturer{…}`, `\scribe{…}`, `\lecturenumber{…}`, `\lecturetitle{…}`, `\lecturedate{…}`, `\lectureterm{…}` and `\lectureinstitution{…}` are stored once. Metadata assignments respect grouping. Course and lecture titles are distinct. `\title`, `\author` and `\date` retain their ordinary storage meanings; rendering does not clear them. Explicit lecture titles take precedence in compact/single headings. Compact/scribe headings use the supplied `\lecturedate`; ordinary lecture and course titles also render the native `\date`. Optional fields disappear when absent or empty.

`\maketitle` uses the selected renderer. `title=inherit` preserves the class command. `boxed` is a nonbreaking local-width kernel box, without a graphical backend. `course` uses a native title page and leaves subsequent page numbering to the class. `\makelecturetitle` always prints a compact lecture heading, useful within a course:

```latex
\chapter{Secure Computation}
\begingroup
\scribe{Student Name}\lecturenumber{7}\lecturetitle{Simulation}
\makelecturetitle
% Included scribe body; theorem numbering follows the book configuration.
\endgroup
```

A two-sided course cover finishes its blank verso before front matter, without PDF page anchors on those cover pages. Title rendering never changes theorem counters or caller PDF metadata. Long material wraps, but a boxed title must fit on one page. `\maketitle` may be repeated intentionally; it prints the current metadata again.

### Fonts and theorems

The named fonts and engine restrictions are listed in the csmath guide. Under pdfLaTeX, `font=kpfonts` falls back to Latin Modern; `font-policy=strict` makes this an error.

Theorem settings come from csthm. `solution=proof` selects an unnumbered proof with a local diamond and optional complete heading. It does not advance theorem counters and cannot be chosen after numbered solutions have been declared. `families=extended,solution=theorem` supplies the numbered solution family instead. `\SetQEDSymbol`, `\setqedsymbol`, `\SetTheoremEndSymbol`, `\settheoremendsymbol`, proof helpers and `\CsthmSetupFamily` retain their foundation contracts. Family typography changes are preamble-only.

### References and algorithms

Ordinary `\label`/`\ref` need no enhanced provider. Use `references=cleveref` for `\cref`/`\Cref`, or `references=zref` for native `\zlabel`/`\zcref`. `references=both` enables both independent stores. cslecture registers csthm’s declared families with zref-clever through its public language/type interface. User type-specific zref names take precedence. Set custom cleveref names after package loading. Existing hyperref options, link colors and PDF metadata are retained.

`\fullref{label}` uses an ordinary label, its enhanced type when available, and its stored name in one outer hyperlink. Without hyperref it prints the ordinary number. No zref facade is installed. The package opts into csthm’s heading-target correction so page-breaking statements link to their actual headings, including with cleveref. Internal anchor strings are independent of displayed numbering.

Load algorithms and deferred proofs explicitly:

```latex
\usepackage[mode=single,references=both]{cslecture}
\usepackage[notoc]{tcscrypto}
\usepackage{codelines}
\usepackage[appendix=true,commandref=cref]{csdeferproofs}
\NewDeferredThm{theoremE}{theorem}
```

Use native `\zlabel` as well as `\label` when both stores are needed. codelines owns unique line identities. Print captured proofs with `\printDeferredProofs`, or select an explicit `unprinted=ignore` policy for deliberate omission. Lecture code never changes the proof queue or algorithm counters.

### Single lecture entry point

Course books use the ordinary `book` class with `mode=series`. Individual

lectures and scribe notes use `article` with `mode=single` or `mode=scribe`.

Book dimensions belong to the class; lecture features belong to cslecture.

Replace `\documentclass{cslectureseries}` with `\documentclass{book}` and load cslecture with `mode=series`.

```latex
\documentclass[11pt,twoside,openright]{book}
\usepackage[mode=series,font=palatino,layout,
  chapters=boxed,headers=course,index,references=cleveref,
  solution=proof]{cslecture}
```

Course covers, boxed chapters, running heads, indexes, and proof-style solutions

remain ordinary options in this package. Theorem stars are unnumbered and do

not advance counters. Use `counters=shared`, `families=extended`, and explicit

numbering options when needed. The standard csmath fonts are available in all

lecture modes.

Csmath annotations retain `\added` and `\changed` text in final output, omit removed text and editorial notes, and retain ordinary `\annotation` footnotes.

Compatible preloaded csmath is checked through its public configuration API. Omitted font/theorem/feature settings inherit the established configuration; explicit conflicts error. Generic csmath layout already owns titles/chapters: use class inheritance or load cslecture first with lecture layout. amsthm and competing theorem systems remain incompatible with csthm. Eudoxus remains incompatible in both orders.

### License

Author: Agni Datta. License: LPPL 1.3c.
