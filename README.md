---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:12 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## csLaTeX

LaTeX packages for computer science research, technical teaching, and academic document preparation.

### Packages

| Package           | Version | Description                                                     |
| :---------------- | :------ | :-------------------------------------------------------------- |
| `codelines`       | 1.0     | Algorithmic listing environment with automated line numbering.  |
| `csamsmath`       | 3.0     | STEM math backbone: fonts, theorems, and annotations.           |
| `csbook`          | 3.0     | Framework for textbooks and large reports.                      |
| `cslecture`       | 3.0     | Skeleton for lecture notes and assignments.                     |
| `cslectureseries` | 3.0     | Document class for academic lecture series and course notes.    |
| `csletter`        | 3.0     | Professional correspondence with configurable aesthetics.       |
| `cspresentations` | 3.0     | Beamer theme built on Metropolis and the Nord color palette.    |
| `csresume`        | 4.1     | CV and resume templating.                                       |
| `csthm`           | 3.0     | Theorem suite with multiple design modes.                       |
| `cswhitepaper`    | 5.0     | Style for technical whitepapers and reports.                    |
| `llncscrypto`     | 3.0     | Typography and theorem extensions for the Springer LLNCS class. |
| `tcscrypto`       | 3.3     | TCS, cryptography, graph, and proof complexity notation macros. |
| `csindex`         | 3.0     | MakeIndex style file for clean, grouped document indexes.       |

### Layout

```text
csLaTeX/
├── [package]/          Package code (.sty/.cls) and README.md
├── CONTRIBUTION.md     Contribution guidelines
├── LICENSE             LPPL v1.3c
└── latexmkrc           Repository-wide build configuration
```

### Installation

Copy the desired `.sty` or `.cls` file into your project folder and load it in the preamble:

```latex
\usepackage{csamsmath}
\usepackage[fancy]{csthm}
```

Each package directory contains a `README.md` with full documentation.

### License

LaTeX Project Public License v1.3c.

### Author

**Agni Datta**—[agnidatta.org](https://agnidatta.org)
