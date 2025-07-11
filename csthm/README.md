---
title: "csthm: Theorem Environments for Computer Science and Mathematics"
linter-yaml-title-alias: "csthm: Theorem Environments for Computer Science and Mathematics"
date created: Monday, June 16th 2025, 12:58:36
date modified: Friday, July 11th 2025, 18:29:06
aliases: "csthm: Theorem Environments for Computer Science and Mathematics"
---

# csthm: Theorem Environments for Computer Science and Mathematics

> **csthm** simplifies the creation of formal mathematical and computer science documents by providing professional, consistent theorem environments with minimal setup.

## Overview

**csthm** is a LaTeX package offering a flexible, modern, and easy-to-use collection of theorem-like environments tailored for computer science, mathematics, and related fields. It delivers visually distinct, semantically meaningful, and cross-reference-friendly formal statements with minimal user configuration.

## Features

- **Three Visual Styles:** Select from `fancy` (modern), `normal` (standard), or `oldschool` (traditional) styles to suit your document’s tone.
- **Extensive Environments:** Supports theorems, lemmas, definitions, corollaries, propositions, claims, axioms, conjectures, observations, remarks, warnings, and more.
- **Numbered & Unnumbered:** All environments come in both numbered and unnumbered variants.
- **Advanced Cross-Referencing:** Seamless integration with `amsthm`, `thmtools`, `cleveref`, and related packages.
- **Minimal Configuration:** Ready to use with sensible defaults, requiring little to no customization.
- **Customizable Headers & Styling:** Easily modify environment names, numbering, symbols, and colors.
- **Professional Typesetting:** Optimized for clarity, readability, and compatibility with Unicode and microtypography.

## Installation

Available on [CTAN](https://ctan.org/pkg/csthm) and included in major TeX distributions.

## Quick Start

Add the package to your preamble:

```latex
\usepackage[oldschool]{csthm} % fancy, normal, oldschool
```

Use environments as usual:

```latex
\begin{theorem}\label{thm:main}
  Every finite group of prime order is cyclic.
\end{theorem}

\begin{definition}
  A function $f$ is injective if $f(x) = f(y)$ implies $x = y$.
\end{definition}
```

Cross-reference easily:

```latex
As shown in~\cref{thm:main}, ...
```

## Documentation

- See doc/csthm-example.tex for usage examples.
- Full manual available on the CTAN page.

## Compatibility

- Supports XeLaTeX, LuaLaTeX, and pdfLaTeX.
- Works with common packages like amsthm, thmtools, mdframed, and cleveref.
- Designed to minimize conflicts and maximize portability.

## Contributing & Support

Contributions, bug reports, and feature requests are encouraged via the project repository. For inquiries or feedback, contact the maintainer or visit the CTAN page.
