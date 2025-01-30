---
title: The `csthm` Package
linter-yaml-title-alias: The `csthm` Package
date created: Wednesday, September 11th 2024, 18:20:56
date modified: Thursday, January 30th 2025, 16:28:03
aliases: The `csthm` Package
---

# The `csthm` Package

## A Comprehensive Set of Theorem Environments for Computer Science

The `csthm` package provides a comprehensive collection of theorem-like environments specifically designed for use in computer science documentation. It features a range of customizable theorem styles, distinct visual markers for different types of content, integrated support for cross-referencing, and extensive customization options. This README provides detailed examples, usage guidelines, and an overview of all available environments and features in the package.

---

## Package Overview

The `csthm` package offers a robust and flexible solution for typesetting theorems, definitions, proofs, and related content typically found in computer science literature. The package provides a variety of specialized environments, each with distinct visual markers and formatting styles suited to different types of content.

### Key features include

- Distinct visual styles for different content types, including theorems, definitions, proofs, and more.
- Customizable theorem headers and QED symbols.
- Optional integration with the `cleveref` package for enhanced cross-referencing.
- Specialized environments tailored for theoretical computer science content.
- Support for both numbered and unnumbered variants of all environments.

---

## Installation

The `csthm` package can be installed via your TeX distribution’s package manager or downloaded directly from CTAN:

- [https://ctan.org/pkg/csthm](https://ctan.org/pkg/csthm)

---

## Basic Usage

To use the package, simply include it in the preamble of your document:

```latex
\usepackage{csthm}
```

If you require integration with the `cleveref` package for enhanced cross-referencing, load the package as follows:

```latex
\usepackage[cleveref]{csthm}
```

---

## Environments

The `csthm` package provides a wide range of theorem-like environments. Each environment is associated with a distinct visual style, marked by a specific bullet symbol. The package supports both numbered and unnumbered versions of each environment, with the unnumbered variants achieved by appending an asterisk (`*`) to the environment name (e.g., `theorem*`).

### Complete List of Environments

| **Environment** | **Style**  | **Description** |
|-----------------|------------|-----------------|
| **Mathematical Theorems** - Marked with black triangle (`$\blacktriangleright$`) |
| theorem | thmstyle | Main theoretical results |
| assumption | thmstyle | Assumptions and prerequisites |
| axiom | thmstyle | Fundamental statements accepted without proof |
| claim | thmstyle | Minor results within proofs |
| conjecture | thmstyle | Unproven mathematical statements |
| corollary | thmstyle | Results that follow from theorems |
| fact | thmstyle | Well-known or established results |
| hypothesis | thmstyle | Proposed explanations or predictions |
| lemma | thmstyle | Supporting theoretical results |
| property | thmstyle | Characteristic attributes or features |
| proposition | thmstyle | Minor theoretical results |
| **Definitions and Protocols** - Marked with black square (`$\blacksquare$`) |
| definition | defstyle | Formal definitions of terms |
| notation | defstyle | Explanation of mathematical notation |
| problem | defstyle | Problem statements or tasks |
| protocol | defstyle | Step-by-step procedures or algorithms |
| **Remarks and Examples** - Marked with hollow triangle (`$\vartriangleright$`) |
| example | remarkstyle | Illustrative examples |
| note | remarkstyle | Additional information or clarifications |
| remark | remarkstyle | Observations or comments |
| **Highlights** - Marked with hollow square (`$\square$`) |
| exercise | hltstyle | Practice problems or exercises |
| highlight | hltstyle | Emphasized content |
| important | hltstyle | Critical information |
| keypoint | hltstyle | Essential concepts or takeaways |
| **Special Environments** |
| proof | proofstyle | Proofs with custom QED symbol |
| case | (list) | Enumerated case analysis |

**Note**: All environments (except `proof` and `case`) have unnumbered versions available by adding an asterisk (`*`) to the environment name (e.g., `theorem*`).

---

### Mathematical Theorems

These environments represent core theoretical results and are marked with a black triangle (`$\blacktriangleright$`):

```latex
\begin{theorem}
This is a sample theorem environment.
\end{theorem}

\begin{assumption}
This is a sample assumption environment.
\end{assumption}

\begin{axiom}
This is a sample axiom environment.
\end{axiom}

\begin{claim}
This is a sample claim environment.
\end{claim}

\begin{conjecture}
This is a sample conjecture environment.
\end{conjecture}

\begin{corollary}
This is a sample corollary environment.
\end{corollary}

\begin{fact}
This is a sample fact environment.
\end{fact}

\begin{hypothesis}
This is a sample hypothesis environment.
\end{hypothesis}

\begin{lemma}
This is a sample lemma environment.
\end{lemma}

\begin{property}
This is a sample property environment.
\end{property}

\begin{proposition}
This is a sample proposition environment.
\end{proposition}
```

---

### Definitions and Protocols

These environments are used for definitions, notations, problems, and protocols, marked with a black square (`$\blacksquare$`):

```latex
\begin{definition}
This is a sample definition environment.
\end{definition}

\begin{notation}
This is a sample notation environment.
\end{notation}

\begin{problem}
This is a sample problem environment.
\end{problem}

\begin{protocol}
This is a sample protocol environment.
\end{protocol}
```

---

### Remarks and Examples

These environments provide additional explanations and clarifications, marked with a hollow triangle (`$\vartriangleright$`):

```latex
\begin{example}
This is a sample example environment.
\end{example}

\begin{note}
This is a sample note environment.
\end{note}

\begin{remark}
This is a sample remark environment.
\end{remark}
```

---

### Highlights and Important Content

These environments emphasize key concepts, tasks, or points, marked with a hollow square (`$\square$`):

```latex
\begin{exercise}
This is a sample exercise environment.
\end{exercise}

\begin{highlight}
This is a sample highlight environment.
\end{highlight}

\begin{important}
This is a sample important environment.
\end{important}

\begin{keypoint}
This is a sample keypoint environment.
\end{keypoint}
```

---

### Special Environments

The `proof` environment provides a custom QED symbol, and the `case` environment allows for enumerated cases:

```latex
\begin{proof}
This is a sample proof environment with a custom QED symbol.
\end{proof}

\begin{case}
\item Case 1: This is the first case.
\item Case 2: This is the second case.
\item Case 3: This is the third case.
\end{case}
```

---

## Customization

The `csthm` package offers extensive customization options.

### Accent Color

To change the accent color used for theorem headers and symbols:

```latex
\setaccentcolor{darkblue}  % or
\renewcommand{\accentcolor}{darkblue}
```

### QED Symbols

Customize the QED symbol used in proof environments:

```latex
\renewcommand\qedsymbol{$\scriptstyle\color{\accentcolor}\blacksquare$}
```

---

## Implementation Notes

### Dependencies

The following packages are required for the correct functionality of the `csthm` package:

- `amsmath` - Provides advanced mathematical typesetting features.
- `amssymb` - Adds additional mathematical symbols.
- `amsthm` - Basic theorem functionality.
- `enumitem` - Customizes list environments.
- `thmtools` - Provides advanced theorem tools.

Optional dependencies include:

- `hyperref` - Enables hyperlinked cross-references.
- `cleveref` - Provides enhanced cross-referencing features.

---

## Version History

- **v1.0 (2024/01/01)**: Initial release.
- **v1.1 (2024/05/15)**: Added support for `cleveref`.
- **v1.2 (2024/08/31)**: Released on CTAN.
- **v1.3 (2025/01/16)**: Current version:
  - Added starred versions of all environments.
  - Enhanced theorem styling.
  - Added new environments.
  - Improved customization options.

---

## License

This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3c or later. The latest version is available at [LaTeX Project Public License](http://www.latex-project.org/lppl.txt).

---

## Contact and Support

For bug reports, feature requests, or general feedback, please contact:

- **Email**: [agnidatta.org@gmail.com](mailto:agnidatta.org@gmail.com)
- **GitHub**: [https://github.com/agnidatta/csthm](https://github.com/agnidatta/csthm)
- **CTAN**: [https://ctan.org/pkg/csthm](https://ctan.org/pkg/csthm)
