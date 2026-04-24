# cslecture

An expansive lecture-notes skeleton configured over the standard `article` class, optimized for high-density information with condensed typography and specialized mathematical environments.

## Features

- **High-Density Typography**: Adjusted spacing and line spreads to eliminate gaps in long-form notes.
- **Enhanced Theorem Display**: Built-in `thmtools` configuration with ruled styles for academic rigor.
- **Semantic Sectioning**: Custom `\parhead` and `\subparhead` commands for inline concept definition.
- **Nested Structures**: Custom `nestedbar` environment for demarcating nested logical blocks or sub-lemmas.

## Installation & Usage

### Loading the Package

```latex
\usepackage{cslecture}
```

### Basic Example

```latex
\documentclass[12pt]{article}
\usepackage{cslecture}

\course{Computer Systems}
\lecturer{Dr. Agni Datta}

\begin{document}
\maketitle
\section{Pipelining}
\parhead{Hazard} A situation that prevents the next instruction from executing.
\end{document}
```

## Package Options
- **None**. The build is strictly dependent on core `cslecture` logic.

## API Reference

### Metadata
- `\course{text}`: Sets the course name for the title block.
- `\lecturer{text}`: Sets the lecturer's name for the title block.
- `\maketitle`: Generates a custom boxed assignment/lecture header.

### Sectioning & Blocks
- `\parhead{text}`: Bold inline heading with automated punctuation.
- `\subparhead{text}`: Small-caps inline heading with automated punctuation.
- `nestedbar`: Environment using vertical bars to demarcate nested logical content.

### Theorems
Standard numbered environments: `theorem`, `lemma`, `definition`, `remark`, `example`, etc.

## Conflicts & Requirements

- **article**: This package is explicitly designed for the `article` document class.
- **maketitle**: Redefining `\maketitle` externally may break the integrated header system.

## License

Everything in this repository is distributed under the **LaTeX Project Public License v1.3c**.
