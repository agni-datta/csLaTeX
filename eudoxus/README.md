---
title: README
aliases: README, 'README, "eudoxus"'
linter-yaml-title-alias: README
date created: Monday, June 22nd 2026, 7:29:06 pm
date modified: Monday, August 24th 2026, 11:00:00 pm
---

<!-- @format -->

## eudoxus

A general mathematics package centered on `amsart`. It bundles typography, page layout, tables, graphics, theorem styles, paragraph headings, and linked references.

### Requirements

- `hyperref` is loaded internally. Do **not** load it again before `\usepackage{eudoxus}`.
- The package does not select a citation system. Load `natbib` or another citation package before `eudoxus` when the bibliography style requires one.
- The `tcs` option requires `tcscrypto.sty` (from the `tcscrypto` package in this repository) to be on the TeX search path. If it is absent, `eudoxus` emits a warning and skips it.
- `geometry` is loaded under the default `layout` mode. If your class already sets page dimensions (e.g. `amsart` with custom geometry), pass `nolayout` to suppress it.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `eudoxus`.

### Usage

```latex
\usepackage[options]{eudoxus}
```

Multiple options may be combined:

```latex
\usepackage[amshacks,epigraph,hacks,pazobiolinum,tcs]{eudoxus}
```

### Minimal Example

```latex
\documentclass[reqno]{amsart}
\usepackage{eudoxus}

\title{A Short Note}
\author{Agni Datta}

\begin{document}
\maketitle

\begin{theorem}[Fermat]
  \label{thm:fermat}
  There are no positive integer solutions to $x^n + y^n = z^n$ for $n \geq 3$.
\end{theorem}

\begin{proof}
  Omitted.
\end{proof}

By~\zcref{thm:fermat}, the equation has no solutions.

\end{document}
```

### Options

| Option           | Default | Effect                                                                                                                         |
| ---------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `nomath`         | off     | Disables all math packages (amsmath, amsthm, mathalpha, …) and implies `notheorems`, `notcs`.                                  |
| `notheorems`     | off     | Skips theorem environment declarations; math packages are still loaded.                                                        |
| `fonts`          | on      | Uses the original Latin Modern and mathalpha font setup.                                                                        |
| `nofonts`        | off     | Suppresses both bundled font setups so that the document can load its own fonts.                                                |
| `pazobiolinum`   | off     | Uses Pazo/Palladio roman and math fonts, scaled Type 1 Biolinum sans, scaled Anonymous Pro mono, and matched math alphabets.    |
| `tcs`            | off     | Loads `tcscrypto` when `tcscrypto.sty` is available on the TeX input path.                                                     |
| `notcs`          | off     | Does not load `tcscrypto` even if the `tcs` flag is set.                                                                       |
| `nolayout`       | off     | Suppresses `geometry` and the default `setspace` load; it also disables the `amsart` bibliography patch.                       |
| `epigraph`       | off     | Loads `epigraph` with right-aligned italic quotations, small-caps sources, width `0.6\textwidth`, and compact vertical spacing. |
| `hacks`          | off     | Sets line spacing to 1.075, emergency stretch to 2 em, display-break level to 2, and a ragged page bottom.                     |
| `amshacks`       | off     | Loads `amsaddr[foot]` for AMS article/book classes and enforces right-hand equation tags.                                      |
| `titlepatch`     | off     | Applies bold sans styling to titles, section headings, `\parhead`, and `\subparhead`.                                          |

### Pazo and Biolinum font bundle

The `pazobiolinum` option uses only Type 1 and NFSS font interfaces, including under LuaLaTeX. It never loads `fontspec`. The sans and monospaced scales match their x-heights to 11 pt Palladio:

```latex
\usepackage[sc,noBBpl]{mathpazo}
\usepackage[type1,scaled=1.085]{biolinum}
\usepackage[ttdefault,scaled=1.03]{AnonymousPro}
```

The option also assigns Biolinum to `\mathsf`, Anonymous Pro to `\mathtt`, BBOLDX to `\mathbb`, STIX calligraphic to `\mathcal`, and Dutch Calligraphic to `\mathscr`. If a document loads Biolinum independently instead, `eudoxus` still assigns Biolinum to `\mathsf`.
It omits the three `bbm` alphabets and the redundant RSFS, esvect, and upgreek symbol families so that this complete font set stays within pdfTeX's legacy math-family limit.

### AMS integration and compact layout

The `amshacks` option loads `amsaddr` with its `foot` option under `amsart` or `amsbook` and sets AMS equation tags on the right. Class options are processed before packages, so an `amsart` document should still state `reqno` in its class line:

```latex
\documentclass[reqno]{amsart}
\usepackage[amshacks,hacks]{eudoxus}
```

The `hacks` option remains independent of `layout`, so it also works together with `nolayout`.

### Theorem Environments

All environments are numbered per section and use small-caps headers. Unnumbered variants are available by appending `*`.

**Theorem-like** (italic body):

`theorem`, `assertion`, `assumption`, `axiom`, `claim`, `conclusion`, `conjecture`, `corollary`, `criterion`, `fact`, `folklore`, `hypothesis`, `informaltheorem`, `lemma`, `metatheorem`, `observation`, `postulate`, `property`, `proposition`

**Definition-like** (roman body):

`application`, `construction`, `convention`, `definition`, `example`, `experiment`, `notation`, `problem`, `protocol`, `result`, `solution`, `step`

**Remark-like** (roman body, lighter weight):

`commentary`, `discussion`, `exercise`, `guideline`, `highlight`, `important`, `insight`, `keypoint`, `motivation`, `notationabuse`, `note`, `openproblem`, `question`, `recall`, `remark`, `summary`, `syntax`, `takeaway`, `tip`, `warning`

**Unnumbered theorem variants**:

`theorem*`, `lemma*`, `corollary*`, `hypothesis*`, `claim*`, `conjecture*`, `informaltheorem*`, `openproblem*`, `syntax*`

**Proof-style variants**:

`proof`, `proofsketch`, `proofidea`, `proofofclaim`

`\setqedsymbol{symbol}` changes the proof-end symbol. `\SetQEDSymbol{symbol}` is kept as a compatibility alias.

### Paragraph headings

`\parhead{Title}` and `\subparhead{Title}` produce bold and small-caps inline headings respectively, with automatic terminal punctuation. They replace `\paragraph` and `\subparagraph`.

With `titlepatch`, `\parhead` and `\subparhead` use bold sans fonts to match the patched section headings. The font commands are exposed as renewable hooks:

```latex
\renewcommand{\edxsectionheadingfont}{\sffamily\bfseries}
\renewcommand{\edxparheadingfont}{\sffamily\bfseries\boldmath}
\renewcommand{\edxsubparheadingfont}{\sffamily\bfseries}
\renewcommand{\edxdocumenttitlefont}{\sffamily\bfseries}
```

The same option also patches standard article-style titles and AMS title handling where the class hooks match.

### Cross-references

Use `\zcref{label}` for ordinary references, `\zcref[S]{label}` when a sentence requires an initial capital, and `\zcrefrange{first}{last}` for ranges. These commands come directly from `zref-clever`; `eudoxus` does not define `cleveref` compatibility aliases. Section-type references use `§` and `§§` markers. Shared theorem counters retain the displayed environment type for definitions, facts, lemmas, propositions, corollaries, theorems, remarks, and open problems.

### Caveats

- The bibliography patch (`\small\setstretch{1.075}`) is applied only when the document class is `amsart` **and** `nolayout` is not set. Under `article` or any other class the bibliography renders at its default size.
- `nolayout` suppresses `geometry`, `setspace`, and the bibliography patch together. Use it when your class or a wrapper package already controls page dimensions.
- The `tcs` option is off by default. Enable it with `\usepackage[tcs]{eudoxus}` to load `tcscrypto` when `tcscrypto.sty` is available on the TeX input path.
- Do not load `amsthm` independently before this package when theorems are enabled: `eudoxus` configures it internally via `\ifeudoxtheorems`.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
