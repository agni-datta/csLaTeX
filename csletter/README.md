---
title: README
aliases: README
linter-yaml-title-alias: README
date created: Thursday, May 14th 2026, 10:22:12 pm
date modified: Tuesday, June 23rd 2026, 8:36:43 pm
---

<!-- @format -->

## csletter

Style package for formal correspondence. Configures colors, margins, line spacing, and optional header/footer/signature/logo elements through key-value options. Handles engine-aware font loading: LuaLaTeX gets proper OpenType Garamond; pdfLaTeX falls back gracefully. Designed for one-page formal letters, cover letters, and referee reports where you want a clean professional layout without fighting LaTeX’s default letter class.

### Requirements

- Use with the `article` class (not the `letter` class: this is a style package, not a class replacement).
- Logo and signature options require external image files on disk.
- Optimized for LuaLaTeX; pdfLaTeX works with font fallbacks.
- Loads `babel` without language options. Choose document languages through the class options or load `babel` explicitly before `csletter`.

### Usage

```latex
\usepackage[options]{csletter}
```

### Minimal example

```latex
\documentclass{article}
\usepackage[accentcolor=NavyBlue, header=true, signature=true,
            signaturefile=sig.png]{csletter}

\begin{document}
\fromname{Agni Datta}
\today

Dear Program Committee,

I am writing to submit the paper entitled...

\cslsignature
\end{document}
```

### Options

All options are key-value pairs. Pass them as a comma-separated list to `\usepackage`.

#### Colors

- `textcolor`: primary body text color. Default: `black`. Accepts any color name known to `xcolor`.
- `accentcolor`: color used for highlighted elements and hyperref links. Default: `blue`.
- `headercolor`: color of the header text. Default: same as `accentcolor`.
- `footercolor`: color of the footer text. Default: `black!60`.

#### Spacing

- `linespacing`: controls body line spacing. Accepted values: `single` (default), `onehalf`, `double`.

#### Margins

All margin options accept a dimension in centimeters.

- `topmargin`: top page margin. Default: `2.5cm`.
- `bottommargin`: bottom page margin. Default: `2.5cm`.
- `leftmargin`: left page margin. Default: `3cm`.
- `rightmargin`: right page margin. Default: `3cm`.

#### Boolean elements

These are boolean options (pass without a value to enable, or `option=false` to disable):

- `header`: render a header block at the top of the first page. Default: `false`.
- `footer`: render a footer at the bottom. Default: `false`.
- `date`: include a formatted date line. Default: `true`.
- `logo`: render the logo image. Default: `false`. Requires `logofile`.
- `signature`: render the signature image above the sender name. Default: `false`. Requires `signaturefile`.

#### File paths

- `logofile`: path to the logo image file (any format supported by `graphicx`).
- `signaturefile`: path to the signature image file.

### API

- `\fromname{text}`: sets the sender name printed in the closing block and used in the header when `header=true`.
- `\csllogo`: renders the logo at the current position. Only produces output when `logo=true` and `logofile` is set; otherwise silently does nothing. Typically placed at the top of the document.
- `\cslsignature`: renders the signature image above the sender name at the current position. Only produces output when `signature=true` and `signaturefile` is set. Place this where you want the closing block to appear.

### Caveats

- The `logo` and `signature` options require image files that exist at compile time. If the file path is wrong or the file is missing, `graphicx` will error. Always use paths relative to the main `.tex` file or absolute paths.
- `header=true` draws a horizontal rule and sender metadata at the top. If you want a custom letterhead image instead, use `logo=true` with `logofile` and leave `header=false`.
- Margin options are passed directly to `geometry`. If you load `geometry` yourself after this package, your settings will override the ones set here: either let `csletter` manage geometry or do not pass margin options to it.
- LuaLaTeX loads Garamond via `fontspec`. On pdfLaTeX, the package falls back to a Garamond-compatible font available in the TeX distribution. If neither is installed, Latin Modern is used silently.

### License

LaTeX Project Public License v1.3c.

### Author

Agni Datta: [agni-datta/csLaTeX](https://github.com/agni-datta/csLaTeX)
