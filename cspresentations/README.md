---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:20 pm
date modified: Tuesday, June 23rd 2026, 12:00:00 am
---

<!-- @format -->

## cspresentation

Beamer theme overlay built on Metropolis with the Nord color palette. Provides a clean, minimal slide aesthetic with full 16-color Nord support, semantic highlight commands, TikZ diagram styles, and helpers for citations, source attribution, and progressive content reveals. Load it instead of calling `\usetheme{metropolis}` directly: it sets up the full environment including fonts, color mappings, and custom refinements that Metropolis alone does not provide.

### Requirements

- Requires the `beamer` document class.
- Requires the Metropolis theme (`beamerthememetropolis`) to be installed. Install via your TeX distribution or from CTAN.
- Optimized for LuaLaTeX with `fontspec`. Works on pdfLaTeX with fallback fonts.

### Usage

```latex
\documentclass{beamer}
\usepackage{cspresentation}
```

No options. All customization is done through the commands and color names provided.

### Minimal example

```latex
\documentclass{beamer}
\usepackage{cspresentation}

\title{Fiat--Shamir in the Presence of Holographic Verifiers}
\author{Agni Datta}
\date{Asiacrypt 2026}

\begin{document}
\maketitle

\begin{frame}{Main Result}
    \kw{Theorem.} Every TTF adversary breaks Fiat--Shamir.
    \begin{itemize}
        \item \good{Positive:} RBR-sound protocols are secure.
        \item \bad{Negative:} Impressionable functions yield attacks.
    \end{itemize}
    \source{Joint work with Campanelli}
\end{frame}

\end{document}
```

### Nord color palette

The full 16 Nord colors are available by name for use in `\textcolor`, TikZ, and anywhere `xcolor` is accepted:

| Name                                                               | Description          |
| ------------------------------------------------------------------ | -------------------- |
| `NordDarkBlack`, `NordBlack`, `NordMediumBlack`, `NordBrightBlack` | Polar Night grays    |
| `NordWhite`, `NordBrightWhite`                                     | Snow Storm whites    |
| `NordIceLight`, `NordIceMedium`, `NordIceDark`, `NordFrost`        | Frost blues          |
| `NordRed`, `NordOrange`, `NordYellow`, `NordGreen`, `NordPurple`   | Aurora accent colors |

### API

#### Semantic text highlights

- `\kw{text}`: keyword highlight in Nord Frost blue. Use for theorem names, key concepts, or terms being defined.
- `\bad{text}`: semantic negative highlight in Nord Red. Use for impossibility results, attack descriptions, or things that fail.
- `\good{text}`: semantic positive highlight in Nord Green. Use for positive results, constructions that work, or desirable properties.
- `\warn{text}`: semantic caution highlight in Nord Orange. Use for caveats, open problems, or conditions that require care.
- `\code{text}`: inline code in typewriter font with a light background. Use for algorithm names, variable names, or pseudocode fragments.
- `\citeref{text}`: small-caps citation reference. Use for author names or paper titles when citing inline on a slide.

#### Layout helpers

- `\source{text}`: attribution line pinned to the bottom of the current slide. Renders in small gray text. Use for joint work credits, image sources, or conference names.
- `\reveal{n}{text}`: renders `text` in accent color on overlay `n`, invisible on earlier overlays. Use for progressive emphasis without the visual noise of Beamer’s full uncover/only mechanism.
- `\csrule`: draws a thin horizontal rule in the current accent color. Use as a visual separator between sections of a slide.

#### TikZ node styles

Three predefined styles for architectural and conceptual diagrams:

- `mainnode`: rounded rectangle with a Nord Frost fill. Use for primary protocol components or main entities.
- `ideabox`: lightly tinted rectangle for secondary concepts or supporting ideas.
- `keybox`: bordered box with accent color for highlighted elements such as the adversary, the reduction, or a key component.

Use these as `[mainnode]`, `[ideabox]`, `[keybox]` in `\node` declarations inside a `tikzpicture`.

### Caveats

- This package sets the full Metropolis theme configuration including fonts, outer/inner themes, and color palette. Do not call `\usetheme{metropolis}` separately: it is already loaded internally.
- `\reveal` uses Beamer overlays. If you use it inside a `block` or `theorem` environment that itself has overlay logic, verify that the overlay numbering is consistent.
- The Nord palette is registered as named colors in `xcolor`. If you load `xcolor` with the `dvipsnames` or `svgnames` option set in a conflicting way, color names may not resolve. Load `xcolor` before this package if you need additional option sets.
- Metropolis requires a sans-serif math font for consistent aesthetics. On pdfLaTeX without the right fonts installed, math may render in a mismatched serif face. LuaLaTeX with `fontspec` gives the intended result.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
