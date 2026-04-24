# cspresentation

A premium Beamer theme overlay built upon the Metropolis theme, utilizing the Nord color palette for modern, clean, and highly readable academic slideshows.

## Features

- **Nord Palette**: Implementation of the full 16-color Nord design system.
- **Metropolis Integration**: Leverages the robust Metropolis theme structure with custom refinements.
- **Custom TikZ Styles**: Predefined styles for nodes, idea boxes, and key points.
- **Academic Utilities**: Specialized commands for citations, source attribution, and content revelation.

## Installation & Usage

### Loading the Package

```latex
\documentclass{beamer}
\usepackage{cspresentation}
```

### Basic Example

```latex
\documentclass{beamer}
\usepackage{cspresentation}

\title{Modern TCS Research}
\author{Agni Datta}

\begin{document}
\maketitle
\begin{frame}{Introduction}
    \kw{Key word} highlighting in Nord colors.
\end{frame}
\end{document}
```

## Package Options
- **None**. Configuration is managed via the internal theme settings and Metropolis options.

## API Reference

### Text Styles
- `\kw{text}`: Key word highlighting (Nord Frost).
- `\bad{text}`, `\good{text}`, `\warn{text}`: Semantic color highlighting.
- `\code{text}`: Formatted inline code.
- `\citeref{text}`: Small-caps citation references.

### Layout Tools
- `\source{text}`: Absolute-positioned source attribution on the slide bottom.
- `\reveal{n}{text}`: Reveal text on a specific slide overlay with accent coloring.
- `\csrule`: A colored horizontal rule.

### TikZ Styles
- `mainnode`, `ideabox`, `keybox`: Standardized styles for architectural and conceptual diagrams.

## Conflicts & Requirements

- **Beamer**: Must be used with the `beamer` document class.
- **Metropolis**: Requires the Metropolis theme package (`beamerthememetropolis`) to be installed.

## License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
