# csLaTeX

A curated collection of LaTeX packages and style files specifically designed for computer science research, technical teaching, and professional academic document preparation.

## Features

- **TCS-Focused Notations**: Specialized macros for cryptography, complexity theory, and algorithms.
- **Premium Aesthetics**: High-end typography with support for multiple professional font families.
- **Collaborative Workflows**: Integrated drafting and annotation systems across primary packages.
- **Engine Versatility**: Robust support for LuaLaTeX, XeLaTeX, and traditional pdfTeX.

## Repository Packages

| Package | Version | Description |
| :--- | :--- | :--- |
| `csamsmath` | 3.0 | STEM math backbone: fonts, theorems, and annotations. |
| `csbook` | 3.0 | Robust framework for textbooks and large reports. |
| `csdirty` | 3.0 | Centralized preamble for all-in-one manuscript setup. |
| `cslecture` | 3.0 | High-density skeleton for lecture notes and assignments. |
| `cslectureseries` | 3.0 | Formal class for academic lecture series and course notes. |
| `csletter` | 3.0 | Professional correspondence with configurable aesthetics. |
| `cspresentations` | 3.0 | Beamer theme built on Metropolis and Nord color palette. |
| `csresume` | 4.1 | Streamlined CV and Resume templating. |
| `csthm` | 3.0 | Comprehensive theorem suite with multiple design modes. |
| `cswhitepaper` | 5.0 | Premium style for technical whitepapers and reports. |
| `llncscrypto` | 3.0 | Cryptographic extensions for the Springer LLNCS class. |
| `tcscrypto` | 3.0 | Extensive TCS and cryptography notation macros. |
| `csindex` | 3.0 | MakeIndex style file for clean, grouped document indexes. |

## Repository Layout

```text
csLaTeX/
├── [package]/              Package code (.sty/.cls) and README.md
├── CONTRIBUTION.md         Contribution guidelines
├── LICENSE                 LPPL v1.3c
└── latexmkrc               Repository-wide build configuration
```

## Installation & Usage

### Manual Installation
Copy the desired `.sty` or `.cls` file from its package directory into your local project folder.

### Usage
Load the package in your document preamble:
```latex
\usepackage{csamsmath}
\usepackage[fancy]{csthm}
```
Detailed documentation and usage examples are available in the `README.md` file within each package directory.

## License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.

## Author

**Agni Datta** — [agnidatta.org](https://agnidatta.org)
