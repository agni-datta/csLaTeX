# csthm

A comprehensive theorem environment suite for Theoretical Computer Science (TCS), providing highly customizable and typographically rigorous styles for lemmas, proofs, and definitions.

## Features

- **Multiple Design Modes**: Choose between `normal`, `fancy`, and `oldschool` aesthetics.
- **Dynamic Accent Colors**: Easily globalize color schemes via `\SetAccentColor`.
- **Integrated Cleveref**: Pre-configured `cleveref` support for all 50+ environment types.
- **Automated Punctuation**: Proof and theorem markers with consistent academic styling.

## Installation & Usage

### Loading the Package

```latex
\usepackage[options]{csthm}
```

### Basic Example

```latex
\documentclass{article}
\usepackage{hyperref} % Required for cleveref support
\usepackage[fancy]{csthm}

\begin{document}
\begin{theorem}[Agni's Theorem]
    $P \neq NP$
\end{theorem}
\end{document}
```

## Package Options

### Style Selection
- `normal`: Ruled headers with standard serif body.
- `fancy`: Colorful left-bar designs with background tints.
- `oldschool`: Classic LaTeX-style theorem formatting with SC-headers.

## API Reference

### Configuration
- `\SetAccentColor{color}`: Globally sets the color for theorem markers and fancy bars.
- `\emailid{address}`: Formatted clickable email command.

### Environment Suites
- **Theorem-like**: `theorem`, `lemma`, `proposition`, `claim`, `conjecture`, `fact`, etc.
- **Definition-like**: `definition`, `protocol`, `problem`, `application`, etc.
- **Remark-like**: `remark`, `note`, `example`, `exercise`, `notationabuse`.
- **Highlight-like**: `guideline`, `important`, `insight`, `warning`.

### Specialized Blocks
- `case`: Custom list environment for proof cases.
- `proof`: Re-implemented proof environment with consistent QED markers.

## Conflicts & Requirements

- **hyperref**: Must be loaded *before* `csthm` to enable automated `cleveref` capitalization and links.
- **thmtools**: This package is the primary engine; avoid loading it with conflicting options.

## License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
