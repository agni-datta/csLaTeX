---
title: csLaTeX
linter-yaml-title-alias: csLaTeX
date created: Monday, March 25th 2024, 14:13:16
date modified: Friday, July 11th 2025, 18:29:05
aliases: csLaTeX
---

# csLaTeX

> Welcome to the `csLaTeX` repository! This repository hosts a curated collection of LaTeX packages and macros tailored for computer science research, teaching, and professional document preparation. Whether you’re a researcher, student, or educator, these packages are designed to streamline your workflow and enhance the quality of your documents.

## Repository Contents

### Package Overview

| Package            | Description                                                                                  |
|--------------------|----------------------------------------------------------------------------------------------|
| `csbook.sty`       | Tools for creating academic books in computer science. Modular options for code, theorems, fonts, TikZ, bibliography, and more. See in-file docs. |
| `csdirty.sty`      | Quick & dirty package for academic writing. Integrates essential packages, versioning, comments, cryptography, and more. [See README](csdirty/README.md) |
| `cslecture.sty`    | Comprehensive settings and environments for academic lectures and notes. Custom theorems, TOC, BibLaTeX, and more. |
| `csletter.sty`     | Customizable letter package for academic and business correspondence. Fonts, colors, headers, logos, and more. |
| `cspresentations.sty` | Custom Beamer theme for academic presentations. Advanced color theming, block environments, cryptography, TikZ, and PGFPlots support. |
| `csthm.sty`        | Theorem environments for computer science and mathematics. Modern, normal, and oldschool styles. [See README](csthm/README.md) |
| `llncscrypto.sty`  | Enhanced style for LNCS + cryptography. Theorems, TikZ, cryptography macros, smart cross-referencing, and more. [See README](llncscrypto/README.md) |
| `tcscrypto.sty`    | Macros and notation for theoretical computer science and cryptography. Complexity classes, protocols, security notions, and more. |
| `csindex.ist`      | Index style configuration for professional formatting of indexes. |

### Features Summary

- **Theorem Environments:** Modern, colored, and classic styles for theorems, definitions, remarks, and more.
- **Academic Book/Report Support:** Modular options for code, fonts, bibliography, and advanced layout.
- **Lecture Notes:** Custom environments, TOC, BibLaTeX, and algorithm support.
- **Letters:** Professional, customizable letter formatting.
- **Presentations:** Beamer theme with cryptography and TCS support.
- **Cryptography Macros:** Notation for protocols, security, complexity, and more.
- **Indexing:** Professional index style for LaTeX documents.

### How to Use

1. Clone or download this repository to your local machine.
2. Copy the desired package (`csbook.sty`, `csdirty.sty`, etc.) into your LaTeX project directory.
3. In your document preamble, import the package using `\usepackage{csbook}` or similar. For index style, see the `.ist` file documentation.
4. Refer to the in-file documentation and subpackage READMEs for detailed usage, options, and examples.

### Example Usage

```latex
\documentclass{book}
\usepackage[biblatex,comments,sourcecode,tikz]{csbook}
\title{A Modern Computer Science Book}
\author{Author Name}
\begin{document}
\maketitle
% ...
\end{document}
```

### Documentation

- Each `.sty` file contains a comprehensive documentation block at the top.
- Additional usage examples and details are available in subpackage READMEs:
  - [csdirty/README.md](csdirty/README.md)
  - [csthm/README.md](csthm/README.md)
  - [llncscrypto/README.md](llncscrypto/README.md)
- For further examples, see the `doc/` folders in subpackages where available.

### Contributions

Contributions are highly encouraged! Please open an issue or submit a pull request for enhancements, bug fixes, or new features. For guidelines, see [CONTRIBUTION.md](CONTRIBUTION.md).

> Thank you for exploring the `csLaTeX` repository. These packages aim to facilitate and enhance your computer science writing and teaching. For inquiries or feedback, please reach out. Here’s to seamless typesetting experiences!
