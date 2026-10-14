---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Monday, October 12th 2026, 12:22:57 am
date modified: Wednesday, October 14th 2026, 3:27:54 am
---

<!-- @format -->

## csLaTeX

LaTeX packages for mathematics, theoretical computer science, cryptography and teaching.

### Packages

| Package                                     | Version | Purpose                                                              |
| ------------------------------------------- | ------- | -------------------------------------------------------------------- |
| [codelines](codelines/README.md)            | 2.0.1   | Pseudocode with nested line numbering and references.                |
| [csmath](csmath/README.md)                  | 1.2.2   | Mathematics, fonts, theorems and optional document features.         |
| [csdeferproofs](csdeferproofs/README.md)    | 3.0.2   | Inline proofs or proofs deferred to an appendix.                     |
| [csextras](csextras/README.md)              | 2.0     | Optional tables, diagrams, lists, bibliography and other utilities.  |
| [cslecture](cslecture/README.md)            | 4.0.1   | Individual lectures, course books and scribe notes.                  |
| [cspresentation](cspresentations/README.md) | 3.2     | Beamer theme based on Metropolis and the Nord palette.               |
| [csresume](csresume/README.md)              | 5.3     | Academic CVs and résumés.                                            |
| [csthm](csthm/README.md)                    | 4.2.1   | Theorem and proof environments.                                      |
| [cswhitepaper](cswhitepaper/README.md)      | 5.2     | Technical reports and author annotations.                            |
| [eudoxus](eudoxus/README.md)                | 2.0.1   | An independent pdfLaTeX mathematics framework.                       |
| [llncscrypto](llncscrypto/README.md)        | 4.0.2   | Extensions for Springer LNCS papers.                                 |
| [tcscrypto](tcscrypto/README.md)            | 3.9.0   | Complexity and cryptography notation, pseudocode and protocol boxes. |

### Installation

Copy the package’s `.sty` file beside your document, or install it in a personal TEXMF tree. Install third-party dependencies through your TeX distribution.

| Package                                    | Files to copy                                                                          |
| ------------------------------------------ | -------------------------------------------------------------------------------------- |
| csmath                                     | `csmath.sty`, `csthm.sty`                                                              |
| cslecture                                  | `cslecture.sty`, `csmath.sty`, `csthm.sty`                                             |
| csthm, codelines, csdeferproofs, tcscrypto | The package’s own `.sty` file                                                          |
| csextras                                   | `csextras.sty`, plus first-party packages for selected features                        |
| llncscrypto                                | `llncscrypto.sty`; the optional Libertine preprint setting also needs csmath and csthm |
| eudoxus                                    | `eudoxus.sty`; the `tcs` option also needs tcscrypto                                   |

The other package guides list their requirements.

### Mathematical writing

```latex
\documentclass{article}
\usepackage[font=palatino,references]{csmath}
\usepackage[notoc]{tcscrypto}
\begin{document}
\section{Results}
\begin{theorem}\label{thm:first}
A theorem involving $\NP$ and $\MCSP$.
\end{theorem}
\begin{proof}An argument.\end{proof}
See \cref{thm:first}.
\end{document}
```

Csmath inherits the document’s fonts unless a font is selected. It supports pdfLaTeX and LuaLaTeX. For books, select `mode=book`; for a class that supplies its own fonts and theorem environments, use `mode=venue`.

The old csamsmath and csbook packages have been replaced by direct csmath loading. The [csmath guide](csmath/README.md#retired-wrappers) explains the article and book settings.

### Lecture notes

```latex
\documentclass{article}
\usepackage[mode=scribe]{cslecture}
\course{Computational Complexity}
\lecturer{Course Instructor}
\scribe{Student Name}
\lecturenumber{7}
\lecturetitle{Circuit Complexity}
\begin{document}
\maketitle
Lecture text.
\end{document}
```

Use `mode=single` for individual lectures and `mode=series` with the ordinary `book` class for a course book. Cslecture replaces the old cslectureseries class.

### LNCS papers

Use the Springer template and load llncscrypto for the extra features you need. Use `notoc` on tcscrypto. The [LNCS guide](llncscrypto/README.md) covers theorem extensions, references, notes and preprint settings.

Eudoxus supplies its own mathematical setup and should be used separately from csmath and csthm. Tcscrypto includes complexity notation; do not also load `complexity.sty`.

### License

Agni Datta. LaTeX Project Public License v1.3c or later; see [LICENSE](LICENSE) and [lppl.txt](lppl.txt).
