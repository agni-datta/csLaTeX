---
title: "csdirty.sty: The Quick & Dirty Package for Academic Writing"
linter-yaml-title-alias: "csdirty.sty: The Quick & Dirty Package for Academic Writing"
date created: Wednesday, June 4th 2025, 14:27:03
date modified: Friday, July 25th 2025, 21:56:08
aliases: "csdirty.sty: The Quick & Dirty Package for Academic Writing"
---

# csdirty.sty: The Quick & Dirty Package for Academic Writing

**Author:** Agni Datta  
**Version:** 1.0 (2025/02/10)

---

## Contents

1. [Overview](#1-overview)
2. [Package Philosophy and Design Goals](#2-package-philosophy-and-design-goals)
3. [Package Options and Versioning](#3-package-options-and-versioning)
4. [Core Package Dependencies](#4-core-package-dependencies)
5. [Document Structure and PDF Management](#5-document-structure-and-pdf-management)
6. [Text, Layout, and Miscellaneous Enhancements](#6-text-layout-and-miscellaneous-enhancements)
7. [Fonts and Mathematical Typesetting](#7-fonts-and-mathematical-typesetting)
8. [Hyperlinks and Referencing](#8-hyperlinks-and-referencing)
9. [Figures and Tables](#9-figures-and-tables)
10. [List Customization](#10-list-customization)
11. [Diagrams and TikZ Graphics](#11-diagrams-and-tikz-graphics)
12. [Appendices Handling](#12-appendices-handling)
13. [Cryptography and Styling Integration](#13-cryptography-and-styling-integration)
14. [Versioning, Comments, and Anonymization](#14-versioning-comments-and-anonymization)
15. [Document Environments: Abstract and Acknowledgment](#15-document-environments-abstract-and-acknowledgment)
16. [Table of Contents and Bibliography Macros](#16-table-of-contents-and-bibliography-macros)
17. [Title and Section Formatting](#17-title-and-section-formatting)
18. [Header and Footer Management](#18-header-and-footer-management)
19. [Class-Specific Adjustments](#19-class-specific-adjustments)
20. [Upright Greek Letters Setup](#20-upright-greek-letters-setup)
21. [Implementation Notes and Best Practices](#21-implementation-notes-and-best-practices)

---

## 1. Overview

The `csdirty.sty` package is a comprehensive LaTeX style file designed to streamline and standardize document preparation for computer science and technical manuscripts. It consolidates a wide array of commonly used packages, macros, and formatting conventions into a single, robust package, enabling authors to focus on content creation while ensuring typographic consistency, advanced mathematical support, and professional document structure.

---

## 2. Package Philosophy and Design Goals

- **Modularity:** Integrates essential LaTeX packages for text, math, graphics, and referencing, reducing boilerplate in document preambles.
- **Consistency:** Enforces uniform formatting for sections, lists, tables, and figures across document classes (`article`, `report`, `book`).
- **Extensibility:** Provides hooks for cryptography, theorem environments, and custom macros, supporting advanced academic writing needs.
- **Accessibility:** Offers options for anonymization, versioning, and comment management, facilitating double-blind review and collaborative workflows.
- **Technical Rigor:** Ensures compatibility with modern TeX engines (pdfTeX, XeTeX, LuaTeX), Unicode, and PDF/A standards.

---

## 3. Package Options and Versioning

`csdirty.sty` defines several boolean flags and user options to control document behavior:

- **comments / nocomments:** Enable or disable in-line comments for collaborative drafts.
- **fullversion / shortversion / preprint:** Toggle between full and abbreviated document versions, useful for submissions and preprints.
- **anonymize:** Suppress author and acknowledgment information for anonymous review.

Options are processed via `\DeclareOption` and set corresponding internal flags (`\ifComments`, `\ifFullVersion`, etc.). Unknown options are ignored gracefully.

---

## 4. Core Package Dependencies

The package loads a curated set of LaTeX packages for foundational functionality:

- **xcolor:** Extended color support (X11, SVG, dvips).
- **calc, comment, etoolbox, ifpdf, iftex, xparse:** Core programming, logic, and macro definition utilities.
- **bxpdfver, geometry, tocbibind, babel, pdfpages, setspace:** PDF versioning, page layout, TOC management, language support, and line spacing.

---

## 5. Document Structure and PDF Management

- **PDF Versioning:** Uses `bxpdfver` for PDF/A compliance and object compression.
- **Geometry:** Sets A4 paper with 3cm margins for optimal readability.
- **TOC and Bibliography:** `tocbibind` ensures bibliography and lists are included in the TOC (excluding the TOC itself).
- **Line Spacing:** Default line stretch is set to 1.125 for improved legibility.

---

## 6. Text, Layout, and Miscellaneous Enhancements

- **csquotes:** Automatic quotation marks and smart citation integration.
- **microtype:** Advanced justification and hyphenation for professional typesetting.
- **textcomp, cite, ulem, emptypage, lipsum, pifont, soul, xspace, xurl:** Additional symbols, citation management, underlining, dummy text, dingbats, highlighting, intelligent macro spacing, and breakable URLs.

---

## 7. Fonts and Mathematical Typesetting

- **Font Encoding:** T1 encoding for proper hyphenation and internationalization.
- **AMS Packages:** `amsfonts`, `amsmath`, `amssymb`, `amsthm` for advanced math environments and symbols.
- **mathrsfs, bm, lmodern, mathtools, moresize, nicefrac, siunitx, mathalpha:** Script fonts, bold math, scalable Latin fonts, math enhancements, additional font sizes, inline fractions, SI units, and custom math alphabets.

---

## 8. Hyperlinks and Referencing

- **hyperref:** Unicode, colored links, PDF bookmarks, and back-references.
- **nameref, xr:** Name-based and cross-document referencing.
- **Custom Macros:** `\fullref` combines `\hyperref`, `\autoref`, and `\nameref` for comprehensive cross-referencing.
- **Backref Customization:** Redefines back-reference formatting for citations.

---

## 9. Figures and Tables

- **adjustbox, array, booktabs, caption, colortbl, dashbox, diagbox, fancybox, float, framed, graphicx, longtable, makecell, multicol, multirow, pdflscape, placeins, ragged2e, rotating, subcaption, tabularray, tabularx, threeparttable, wrapfig, xtab:** Extensive support for advanced table and figure layouts, including multi-page tables, colored cells, landscape pages, and subfigures.
- **Caption Setup:** Configures caption fonts, label formatting, and positioning for both tables and figures.

---

## 10. List Customization

- **enumitem:** Fine-grained control over enumerate and itemize environments.
- **Global Spacing:** Suppresses vertical spacing between list items.
- **Custom Labels:** Nested enumerate and itemize levels use distinct numbering and symbols for clarity.

---

## 11. Diagrams and TikZ Graphics

- **epigraph, tcolorbox, mdframed, pgfplots, tikz, tikz-cd, tikz-3dplot:** Support for epigraphs, colored boxes, framed environments, data plots, commutative diagrams, and 3D graphics.
- **TikZ Libraries:** Loads a comprehensive set of libraries for automata, backgrounds, decorations, graphs, matrix layouts, patterns, positioning, and more, enabling sophisticated diagrammatic representations.

---

## 12. Appendices Handling

- **appendix:** Provides advanced appendix management, including TOC integration, page breaks, title and header prefixing, and titletoc support.

---

## 13. Cryptography and Styling Integration

- **csthm:** If available, loads the `csthm` package for theorem environments with the `oldschool` option.
- **tcscrypto:** Loads cryptography macros if present.
- **orcidlink:** Adds ORCID ID and icon support for author metadata.

---

## 14. Versioning, Comments, and Anonymization

- **Version Switches:** Macros `\fullversion`, `\shortversion`, and `\usecomments` allow dynamic toggling of document state.
- **Custom Comments:** `\newcomment{name}{color}{command}` defines colored, author-tagged comment macros, visible only if comments are enabled.
- **Anonymization:** The `acknowledgment` environment is suppressed if anonymization is active, ensuring compliance with double-blind review requirements.

---

## 15. Document Environments: Abstract and Acknowledgment

- **Abstract:** Redefines the `abstract` environment for both `book` and non-`book` classes. The abstract is typeset in a small, indented quotation with a bold title and is automatically added to the TOC as a section.
- **Acknowledgment:** The `acknowledgment` environment adapts its formatting based on the document class (`book`, `report`, or `article`) and is hidden if anonymization is enabled.

---

## 16. Table of Contents and Bibliography Macros

- **\toc:** Custom macro to insert a table of contents with controlled vertical spacing and page breaks.
- **\printbib{bibfile}:** Macro to print the bibliography using the `alphaurl` style, with vertical spacing and page breaks for visual separation.

---

## 17. Title and Section Formatting

- **hep-title:** Lightweight package for title formatting.
- **Font Macros:** Defines `\titlefont`, `\subtitlefont`, `\authorfont`, `\affiliationfont`, `\datefont`, and `\preprintfont` for consistent title block styling.
- **Section Formatting:** Uses `titlesec` to standardize section, subsection, subsubsection, paragraph, and subparagraph formatting, including font size, style, and spacing.
- **Chapter and Part Formatting:** Customizes chapter and part titles for `book` and `report` classes, including titlerules and alignment.

---

## 18. Header and Footer Management

- **fancyhdr:** The `\simplefancyheader` macro sets up a simple header/footer scheme with the document title and page number, ensuring a clean and professional appearance.

---

## 19. Class-Specific Adjustments

- **\AtBeginDocument:** Applies class-specific formatting at document start:
  - `article`: Sets section formats.
  - `report`: Sets chapter and section formats, headers, and TOC spacing.
  - `book`: Sets chapter, part, and section formats, headers, and TOC spacing.

---

## 20. Upright Greek Letters Setup

- **mathastext, upgreek:** Enables upright Greek letters in math mode, with LGR encoding and fallback definitions for missing macros.
- **Macro Redefinitions:** If upright forms are available, standard Greek macros are overwritten to use upright variants, ensuring typographic consistency in mathematical notation.

---

## 21. Implementation Notes and Best Practices

- **Macro Hygiene:** All new commands and environments are defined using `xparse` for robust argument parsing and future compatibility.
- **Fallbacks and Warnings:** Conditional loading and warnings for optional packages (`csthm`, `tcscrypto`) ensure graceful degradation if dependencies are missing.
- **Spacing and Visual Separation:** Strategic use of `\vfill`, `\clearpage`, and line spacing macros ensures visually distinct document sections.
- **Customization:** Users are encouraged to further extend or override macros as needed for project-specific requirements, leveraging the modular structure of `csdirty.sty`.

---

## Example Usage

In your LaTeX document preamble:

```latex
\usepackage[comments,fullversion]{csdirty}

\title{A Comprehensive Study of Secure Multiparty Computation}
\author{Alice Smith}
\date{\today}

\begin{document}
\maketitle

\begin{abstract}
This paper explores...
\end{abstract}

\toc

% Main content...

\printbib{references}
```

---

## Credits and License

- **Author:** Agni Datta
- **License:** LPPL (LaTeX Project Public License)
- For bug reports, feature requests, or contributions, please refer to the repository documentation.

---

**END OF README**
