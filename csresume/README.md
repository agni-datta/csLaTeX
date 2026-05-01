---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Sunday, April 12th 2026, 9:15:02 pm
date modified: Friday, May 1st 2026, 11:23:02 pm
---

## csresume

A streamlined LaTeX package for creating visually striking CVs and Resumes, designed for professional academic and industrial correspondence with a focus on high-end typography.

### Features

- **Lightweight Design**: Avoids heavy graphical backends or complex XML parsing.
- **Academic Optimization**: Built-in support for Biber/BibLaTeX with ydnt sorting (Year-Descending).
- **Flexible Typography**: Support for GFS Didot, Libertinus, and Baskervaldx font families.
- **Professional Layout**: Integrated contact blocks, chronological detail entries, and referral formatting.

### Installation & Usage

#### Loading the Package

```latex
\usepackage[options]{csresume}
```

#### Basic Example

```latex
\documentclass[a4paper]{article}
\usepackage[baskerville, allowbreaks]{csresume}

\begin{document}
\contactblock{Agni Datta}{Researcher}{TCS Research}{agni@example.com}{agnidatta.com}{user}{pid}
\section{Education}
\details{2020--2024}{PhD in Computer Science}{Stanford}{Thesis on Lattice-based Cryptography}
\end{document}
```

### Package Options

#### Fonts

- `gfsdidot`: (Default) GFS Didot serif.
- `libertinus`: Libertinus Serif and Sans.
- `baskerville`: Professional Baskervaldx integration.
- `euler`: Replaces math digits with Euler digits.

#### Layout

- `allowbreaks`: Permits sections to break across pages (ideal for multi-page CVs).

### API Reference

#### Header & Contact

- `\contactblock{Name}{Title}{Company}{Email}{Web}{ScholarID}{DBLPID}`: Generates the resume header.

#### Entry Commands

- `\details{Years}{Degree/Title}{Institution}{Description}`: Chronological entry with margin years.
- `\columndetails{Years}{Title}{RightText}`: Two-column entry for skills or short items.
- `\referals{Name}{Title}{Org}{Address}{Email}{Web}`: Standardized referral block.

#### Environments

- `refcolumns`: Two-column layout for references.
- `ditemize`: Two-column itemized list.

### Conflicts & Requirements

- **article**: Best used with the `article` document class.
- **biblatex**: Requires `biber` as the backend for publication lists.

### License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
