---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:30 pm
date modified: Tuesday, May 19th 2026, 1:35:34 am
---

<!-- @format -->

## csresume

CV and resume package with academic-oriented typography, flexible entry layouts, and BibLaTeX integration for publication lists. Handles the full structure of an academic CV: contact header, chronological entries with margin years, two-column reference blocks, and a publications section driven by a `.bib` file. Font choices are tuned for print and screen readability.

### Requirements

- Use with the `article` document class on A4 or letter paper.
- Requires `biber` as the BibLaTeX backend for publication lists. `bibtex` is not supported.
- Logo and signature image files must exist on disk if used.

### Usage

```latex
\usepackage[options]{csresume}
```

### Minimal example

```latex
\documentclass[a4paper]{article}
\usepackage[baskerville]{csresume}

\begin{document}

\contactblock{Agni Datta}{Researcher}{IIT Bombay}{agnidatta.org@gmail.com}{agnidatta.org}{agni-scholar-id}{agni-dblp-id}

\section{Education}
\details{2020--2024}{PhD in Computer Science}{Stanford University}{Thesis: On the Security of Fiat--Shamir}

\section{Publications}
% BibLaTeX-driven list goes here

\end{document}
```

### Options

#### Font options (mutually exclusive)

- `gfsdidot`: (default) GFS Didot serif. Classical and elegant; works well in print.
- `libertinus`: Libertinus Serif and Sans. Slightly wider, very readable on screen.
- `baskerville`: Baskervaldx. Traditional academic serif with strong contrast.
- `euler`: Euler digits in math mode. Combine with another font option for body text if needed.

#### Layout options

- `allowbreaks`: permits sections to break across pages. By default, section headers try to stay with their first entry. Enable this for very long CVs where page break control is impractical.

### API

#### Header block

- `\contactblock{Name}{Title}{Institution}{Email}{Website}{ScholarID}{DBLPID}`: generates the full CV header with name, title, institutional affiliation, and contact links. All arguments are required; pass an empty `{}` for any field you want to suppress.

#### Chronological entries

- `\details{Years}{Degree or Title}{Institution}{Description}`: standard chronological entry. Years appear in the left margin, the rest flows to the right. Use for education, positions, and awards.
- `\columndetails{Years}{Title}{RightText}`: two-column entry where both `Title` and `RightText` appear side by side on the same line. Use for entries where the right column is short (e.g., a grade or location).

#### Reference blocks

- `\referals{Name}{Title}{Organization}{Address}{Email}{Website}`: formats a single referee entry with contact details.
- `refcolumns`: two-column layout environment for displaying multiple referees side by side. Wrap `\referals` calls inside this environment.

```latex
\begin{refcolumns}
    \referals{Prof.\ A}{Chair}{MIT}{Cambridge, MA}{a@mit.edu}{mit.edu/a}
    \referals{Prof.\ B}{Director}{ETH}{Zurich}{b@ethz.ch}{ethz.ch/b}
\end{refcolumns}
```

#### Lists

- `ditemize`: two-column itemized list. Use for skills, programming languages, or other short paired entries where a single-column list would waste space.

### Publications list (BibLaTeX)

`csresume` is designed to work with a `\printbibliography` call inside a `publications` section. Set up BibLaTeX in the preamble:

```latex
\usepackage[backend=biber, style=alphabetic, sorting=ydnt]{biblatex}
\addbibresource{publications.bib}
```

Then in the document:

```latex
\section{Publications}
\printbibliography[heading=none]
```

The `ydnt` sorting order (year descending, name, title) puts the most recent papers first, which is standard for academic CVs.

### Caveats

- `\contactblock` renders all seven fields. If you leave `ScholarID` or `DBLPID` empty, the corresponding link is suppressed. Do not omit the argument: pass `{}`.
- The `allowbreaks` option changes section penalty values globally. If your CV has only a few sections and you want fine-grained control, it is usually better to insert `\pagebreak` manually rather than enabling this option.
- BibLaTeX requires two compile passes with `biber` between them: `lualatex → biber → lualatex → lualatex`. If you use `latexmk`, add `$bibtex_use = 2;` to your `.latexmkrc`.
- Font options affect body text only. Math mode uses the default math font unless you also load a math font package.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
