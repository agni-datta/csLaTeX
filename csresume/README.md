<!-- @format -->

# csresume 5.4

An academic CV package with a compact institutional letterhead, dated entries, referee columns, and BibLaTeX publication lists. It uses the document class’s default Computer Modern roman, sans-serif, and math fonts. There are no font-selection or color options.

## Requirements

Use an 11pt `article` document with pdfLaTeX. Publication lists use BibLaTeX’s numeric style with Biber and descending numbered list labels. Records are sorted by descending year, name, and title. Choose the language and paper size through the document class. The package uses symmetric 0.8in margins and 1.075 line spacing.

## Example

```tex
\documentclass[english,letterpaper,11pt]{article}
\usepackage{csresume}
\addbibresource{publications.bib}
\cvbibname{Ada}{Example}
\finishcv{\today}{https://example.edu}

\begin{document}
\cvheader
  {University}{Department}{Street\\City and postcode}
  {Name}{Position}{name@example.edu}{example.edu}{scholar-id}{dblp-id}

\section{Education}
\details{2020--2024}{PhD in Computer Science}{University}{Thesis: Title}

\section{Publications}
\nocite{*}
\printbibliography[heading=none]

\end{document}
```

## Commands

- `\cvorcid{Identifier}` declares an optional linked ORCID, displayed on a separate typewriter line in the header. The nine-argument header API is unchanged.
- `\cvheader{Institution}{Department}{Address}{Name}{Position}{Email}{Website}{ScholarID}{DBLPID}` follows an institutional letterhead layout: a larger, regular sans-serif name at left above a thin rule; position and electronic contacts at left and institution/department/address at right below it. Optional fields may be empty. Use plain text for the name; it also sets the PDF author metadata. Website arguments accept either a complete HTTP(S) URL or a bare domain. Scholar and DBLP links display their service names, not raw identifiers.
- `\contactblock{Name}{Position}{Address}{Email}{Website}{ScholarID}{DBLPID}` preserves the previous seven-argument API. Use `\cvheader` for the complete institutional letterhead.
- `\cvbibname{GivenName}{FamilyName}` highlights the exact matching bibliography name in roman small capitals, using BibLaTeX’s name-formatting hooks. Keep author fields in the databases as plain names. No name is highlighted unless declared.
- `\details{Dates}{Role}{Institution}{Description}` places a wrapping role at left and dates at right, with the institution on the second line and the description below. Empty institution or description fields produce no blank line. Entries can break naturally after their opening lines.
- `\columndetails{Label}{Description}{RightText}` produces a compact row with an aligned short label, a wrapping description, and a short right-hand field in sans-serif type. `\cvright{Text}` applies the same formatting to other right-aligned metadata.
- `\years{Text}` prints a right-aligned date on its own line. For a date beside an entry, use `\details` or put the date in the third argument of `\columndetails`.
- `\referals{Prefix}{GivenName}{FamilyName}{Role}{Organization}{Address}{Email}{Website}` formats one referee. The spelling and eight-argument signature are retained for existing users.
- `\finishcv{Date}{Website}` declares the update date and website for the actual last page, with the website at left and date at right, keeping the page number centered on every page. Declare it in the preamble. The native `lastpage` label identifies the final page after LaTeX reruns, so moving or adding content does not require moving this command. Run `latexmk` to settle page references.
- `refcolumns` places referee blocks in two columns. `ditemize` provides a compact two-column itemized list.

The `allowbreaks` option disables the small space reservation at the start of an entry. By default, entries reserve enough room for their opening lines; long descriptions can still cross a page boundary.

## Typography and Migration

Text and rules are black; hyperlink text uses the X11 color `SteelBlue4`. URLs, email addresses, Scholar, DBLP, and ORCID use Computer Modern typewriter. Section and subsection headings sit left-aligned between two full-width thin rules and use regular sans-serif type without letter spacing or forced capitals. Sections use `\large`; subsections use `\normalsize`, with `\smallskip` around the rules and compact, consistent gaps between sections. Referee columns use a smaller outer gap. Right-aligned appointment dates, postal addresses, and compact metadata use sans-serif type. Publication titles are italic; author punctuation, venue details, and dates use the native numeric bibliography layout. Publication dates remain in the entries rather than a separate right-hand column.

Visible bibliography labels count down across all printed categories in typewriter font (`\texttt`) with square brackets, padded to at least two digits, such as `[09]` through `[01]`. The total is counted from loaded bibliography records; print every loaded record exactly once to obtain a complete descending sequence. This customization applies to the publication-list labels; inline citations retain the native numeric citation labels. Labels align with the heading’s left edge; the bibliography adds no extra space above or below the list. Original keys, sorting, author order, and source records are preserved. Deferred native numbering supports split categories without package warnings. ISBNs, ISSNs, and book-series names are omitted from the CV display; bibliography records retain those fields.

Version 5.0 removes `font=...`, `gfsdidot`, `libertinus`, `baskerville`, and `euler`. Remove those options from existing documents. The package no longer loads fontspec, unicode-math, custom font providers, marginnote, or PDF-version patches. Internal state and helpers use expl3; public commands and environments use the LaTeX document-command interface. Standard geometry, table, heading, and bibliography packages keep their native configuration APIs.

Mark records with `keywords = {randomized-authorship}` to append a parenthesized SteelBlue4 dagger linked to the authorship explanation. Place `\cvauthorshiplegend` exactly once in that explanation to create its destination. `\cvrandomized` prints the linked marker elsewhere. Both commands keep the glyph outside italic title formatting.

`\cvlabel{Text}` sets an education or other item label in roman small capitals. `\&` uses only the upright Biolinum ampersand, including in sans-serif contexts and math mode. The local font selection leaves surrounding text and default fonts unchanged. TeX Live’s `libertine` font files supply this isolated glyph; the package does not load the Biolinum font package.

## Checks

The real CV checks pdfLaTeX/Biber integration and publication rendering. The fixture `tests/layout.tex` additionally covers both header signatures, omitted optional fields, long entry titles, compact rows, referee columns, the default roman/sans fonts, small-capital labels, the isolated text/math ampersand, right-aligned dates, and last-page footer placement in a two-page document.

From the csLaTeX repository, use an external output directory:

```sh
mkdir -p /tmp/csresume-check
TEXINPUTS="$PWD/csresume:" latexmk -norc -pdf \
  -interaction=nonstopmode -halt-on-error \
  -outdir=/tmp/csresume-check csresume/tests/layout.tex
```

Inspect the log for unresolved references, missing glyphs, and overfull boxes, then render and inspect the PDF. Rebuild the dependent CV after any output-affecting change.

## License

LaTeX Project Public License v1.3c.
