---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:21:51 pm
date modified: Thursday, May 14th 2026, 10:24:27 pm
---

<!-- @format -->

## csindex

MakeIndex style file (`.ist`) for typographically clean document indexes with letter headings and dotfill leaders.

### Usage

Not loaded via `\usepackage`. Pass it to the `makeindex` processor.

#### With `imakeidx` (recommended)

```latex
\usepackage[makeindex, options=-s csindex.ist]{imakeidx}
\makeindex
```

#### Manual compilation

```bash
makeindex -s csindex.ist yourfile.idx
```

### Features

- Groups entries under bold letter headings (A, B, … Symbols).
- Dotfill leaders between entries and page numbers.
- No LaTeX package options—this is a configuration style file.

### Requirements

- `makeindex` executable must be on the system build path.
- `csindex.ist` must be accessible to the compiler (usually the same directory as the main `.tex` file).

### License

LaTeX Project Public License v1.3c.
