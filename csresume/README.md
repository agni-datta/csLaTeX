---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:30 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## csresume

CV and resume package with academic-oriented typography and BibLaTeX integration.

### Usage

```latex
\usepackage[options]{csresume}
```

```latex
\documentclass[a4paper]{article}
\usepackage[baskerville, allowbreaks]{csresume}

\begin{document}
\contactblock{Agni Datta}{Researcher}{TCS Research}{agni@example.com}{agnidatta.com}{user}{pid}
\section{Education}
\details{2020--2024}{PhD in Computer Science}{Stanford}{Thesis on Lattice-based Cryptography}
\end{document}
```

### Options

#### Fonts

- `gfsdidot`—(Default) GFS Didot serif.
- `libertinus`—Libertinus Serif and Sans.
- `baskerville`—Baskervaldx.
- `euler`—Euler digits in math mode.

#### Layout

- `allowbreaks`—permits sections to break across pages.

### API

#### Header

- `\contactblock{Name}{Title}{Company}{Email}{Web}{ScholarID}{DBLPID}`—generates the resume header.

#### Entries

- `\details{Years}{Degree/Title}{Institution}{Description}`—chronological entry with margin years.
- `\columndetails{Years}{Title}{RightText}`—two-column entry.
- `\referals{Name}{Title}{Org}{Address}{Email}{Web}`—referral block.

#### Environments

- `refcolumns`—two-column layout for references.
- `ditemize`—two-column itemized list.

### Conflicts

- Best used with the `article` document class.
- Requires `biber` as the backend for publication lists.

### License

LaTeX Project Public License v1.3c.
