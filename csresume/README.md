---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:30 pm
date modified: Tuesday, June 23rd 2026, 12:00:00 am
---

<!-- @format -->

## csresume

CV and resume package with academic-oriented typography, flexible entry layouts, and BibLaTeX integration for publication lists. Handles the full structure of an academic CV: contact header, chronological entries with margin years, two-column reference blocks, compact interest lists, and a publications section driven by a `.bib` file. Font choices are tuned for print and screen readability, while the default visual palette uses RoyalBlue4 and darker RoyalBlue4 mixtures.

### Requirements

- Use with the `article` document class on A4 or letter paper.
- Requires `biber` as the BibLaTeX backend for publication lists. `bibtex` is not supported.
- LuaLaTeX or XeLaTeX is recommended for the modern font stack. pdfLaTeX is supported through a conservative fallback.
- Logo and signature image files must exist on disk if used by surrounding project code.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `csresume`.

### Usage

```latex
\usepackage[options]{csresume}
```

### Minimal example

```latex
\documentclass[a4paper]{article}
\usepackage[libertinus]{csresume}

\begin{document}

\contactblock{Name}{Researcher}{Institution}{name@example.edu}{example.edu}{scholar-id}{dblp-id}

\section{Education}
\details{2020--2024}{PhD in Computer Science}{Stanford University}{Thesis: On the Security of Fiat--Shamir}

\section{Publications}
% BibLaTeX-driven list goes here

\finishcv{\today}{https://example.edu}

\end{document}
```

### Options

#### Font options (mutually exclusive)

- `gfsdidot`: (default) GFS Didot via `fontsetup`. Classical and elegant; works well in print.
- `libertinus`: Libertinus Serif and Sans with KPMath and Libertinus math ranges. Slightly wider, very readable on screen.
- `baskerville`: Baskervaldx with KPMath and Baskervaldx math ranges. Traditional academic serif with strong contrast.
- `euler`: Concrete Roman with Euler Math via `fontsetup`.

Under LuaLaTeX and XeLaTeX, sans-serif text uses Libertinus Sans and monospace text uses Anonymous Pro.

#### Layout options

- `allowbreaks`: permits sections to break across pages. By default, section headers try to stay with their first entry. Enable this for very long CVs where page break control is impractical.

### API

#### Header block

- `\contactblock{Name}{Title}{Institution}{Email}{Website}{ScholarID}{DBLPID}`: generates the full CV header with name, title, institutional affiliation, and contact links.

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

#### Footer

- `\finishcv{Date}{URL}`: prints a modern muted footer of the form `Updated Date • URL`. Pass the complete URL, including the scheme, for example `https://example.edu`; the command does not prepend `https://`.

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

The `ydnt` sorting order (year descending, name, title) puts the most recent papers first, which is standard for academic CVs. Titles of articles, proceedings papers, theses, and unpublished manuscripts are printed in italics; unpublished manuscripts are not enclosed in quotation marks.

### Caveats

- `\contactblock` expects all seven fields.
- `\finishcv` expects a complete URL. Use `\finishcv{\today}{https://example.edu}`, not `\finishcv{\today}{example.edu}`.
- The `allowbreaks` option changes section penalty values globally. If your CV has only a few sections and you want fine-grained control, it is usually better to insert `\pagebreak` manually rather than enabling this option.
- BibLaTeX requires two compile passes with `biber` between them: `lualatex → biber → lualatex → lualatex`. If you use `latexmk`, add `$bibtex_use = 2;` to your `.latexmkrc`.
- Font options configure the body, sans, mono, and math stack under LuaLaTeX and XeLaTeX; pdfLaTeX uses the package fallback.

### License

LaTeX Project Public License v1.3c.

### Repository

[csLaTeX](https://github.com/agni-datta/csLaTeX)
