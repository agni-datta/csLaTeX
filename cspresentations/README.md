---
title: CS Presentations Package (`cspresentations.sty`)
linter-yaml-title-alias: CS Presentations Package (`cspresentations.sty`)
date created: Wednesday, December 4th 2024, 20:11:49
date modified: Wednesday, December 4th 2024, 20:13:28
aliases: [CS Presentations Package (`cspresentations.sty`)]
---

# CS Presentations Package (`cspresentations.sty`)

The `cspresentations` package is a custom Beamer theme tailored for academic presentations in computer science and related disciplines. It integrates advanced mathematical typesetting, cryptographic notations, and aesthetically refined presentation elements, optimising clarity and visual engagement for technical audiences.

**Author:** Agni Datta  
**Version:** v1.1  
**Date:** 2024/12/05

## Package Overview

The `cspresentations` package enhances the Beamer class by providing a robust configuration and theme that includes specialised mathematical and cryptographic packages, professional styling, and user-friendly options for creating impactful presentations. It features consistent design elements, seamless compatibility with `TikZ` and `PGFPlots`, and support for high-quality typography and graphics.

## Features

### Core Packages

This package integrates essential LaTeX packages to support mathematics, typography, and multimedia inclusion. Key packages include `amsmath`, `amsfonts`, and `mathtools` for advanced mathematical formatting, as well as `graphicx` and `multimedia` for image and multimedia embedding. Typography is enhanced using `microtype`, `babel`, and `fontenc`, ensuring readability and smooth rendering.

### Beamer Theme Configuration

The `cspresentations` package builds upon the `Rochester` Beamer theme and the `whale` colour theme. It introduces a custom accent colour (`RoyalBlue1`) for consistent branding and provides customisation of headers, footers, blocks, and navigation symbols. It offers predefined styling for `title`, `author`, `date`, and `frametitle` elements, optimising their visibility and aesthetic appeal.

### Mathematics and Cryptography

It supports advanced mathematical typesetting using `amsmath` and `mathtools`, with specialised cryptographic notation through the `tcscrypto` package. Fonts for calligraphic and blackboard bold symbols are managed via `mathalpha`, providing flexibility for mathematical proofs and algorithmic notations.

### Graphics and Plotting

The package incorporates `tikz` and `pgfplots` for creating high-quality vector graphics and plots. It includes support for various `TikZ` libraries, such as `arrows.meta`, `calc`, `shapes`, and `mindmap`, enabling detailed diagrams and advanced visualisations. `PGFPlots` compatibility is maintained with version `1.18` for generating structured plots.

### Block and Element Styling

The package defines custom styles for Beamer blocks, including regular, alert, and example blocks. Each type is styled with specific colour schemes to enhance content differentiation and audience focus. The package also customises list elements, including itemised and enumerated lists, with modern circle-based bullet points and accent-coloured indicators.

### Navigation and Structure

It enhances navigation by styling the table of contents, section numbers, and subsection numbers with the accent colour. Navigation symbols are styled for consistency, and an option to disable them is provided. Appendices are handled separately using `appendixnumberbeamer`.

### Advanced Customisation

Users can define custom box styles (`colbox`, `defbox`, and `quesbox`) for emphasis or specific content. These boxes are implemented using the `tcolorbox` package, with flexible dimensions, border styles, and background colours.

## Usage

To use the package, include it in the preamble of your Beamer document:

```latex
\documentclass{beamer}
\usepackage{cspresentations}

\title{Introduction to Cryptography}
\author{Agni Datta}
\date{\today}

\begin{document}

\begin{frame}
    \titlepage
\end{frame}

\begin{frame}{Example Block}
    \begin{exampleblock}{Euler’s Theorem}
        Let \( a \) and \( n \) be coprime integers. Then \( a^{\phi(n)} \equiv 1 \pmod{n} \), where \( \phi \) is the Euler totient function.
    \end{exampleblock}
\end{frame}

\end{document}
```

This example demonstrates the integration of the `cspresentations` package into a Beamer presentation, showcasing block styling and mathematical typesetting.
