<!-- @format -->

# csresume 5.7.0

An academic CV package with a compact institutional letterhead, dated entries, referee rows and columns, and BibLaTeX publication lists. It uses the document class’s default Computer Modern roman, sans-serif, and math fonts. The `moresize` package supplies `\HUGE`; `fix-cm` enables its actual size in Computer Modern without font-size substitutions. There are no font-selection options. The `accent` option selects the shared color for name initials, links, and authorship markers.

## Requirements

Use an 11pt `article` document with pdfLaTeX. Publication lists use BibLaTeX’s numeric style with Biber and descending numbered list labels. Records are sorted by descending year, name, and title. Choose the language and paper size through the document class. The package uses symmetric 0.8in margins and 1.075 line spacing.

## Example

```tex
\documentclass[english,letterpaper,11pt]{article}
\usepackage[accent=RoyalBlue4]{csresume}
\addbibresource{publications.bib}
\cvprofile{
  name = {Ada Example},
  position = {Researcher},
  institution = {Example University},
  department = {Department of Computer Science},
  address = {1 Example Street\\Example City},
  email = {ada@example.edu},
  website = {example.edu},
  bib-given = {Ada}, bib-family = {Example},
}
\finishcv{\today}{https://example.edu}

\begin{document}
\makecvheader

\begin{cvsection}{Education}
  \begin{cventry}{2020--2024}{PhD in Computer Science}{Example University}
    \begin{cvitems}
      \item \cvlabel{Thesis:} A research title.
    \end{cvitems}
  \end{cventry}
\end{cvsection}

\begin{cvsection}[reserve=8]{Publications}
  \nocite{*}
  \cvpublicationgroup{inproceedings}{Conference Papers}
\end{cvsection}

\end{document}
```

## Structured interface

Use `cvsection` for each top-level CV section and `cventry` for a dated entry with its description in the environment body. `cvitems` inherits the package's compact item-list settings. These environments use the existing renderers, so migrating source structure does not select a new visual design.

| Interface                                      | Purpose                                                                                                                                    |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `cvsection[reserve=0]{Title}`                  | Prints the native section heading; `reserve` keeps the given nonnegative number of baseline lines available before the heading.            |
| `cventry{Dates}{Title}{Institution}`           | Prints the dated heading and optional institution, followed by the environment body. Empty institution and body fields add no blank lines. |
| `cvitems`                                      | A compact itemized list using the package's native list settings.                                                                          |
| `\cvdatedline{Dates}{Text}`                    | A dated line in normal roman weight, suitable for reviewing or service entries.                                                            |
| `\cvpublicationgroup[reserve=0]{Type}{Title}`  | Prints a native BibLaTeX type-filtered group with a subsection heading; accepts the same line reservation as `cvsection`.                  |
| `\cvtopic{Colour}{Label}`                      | A small-capital research-area label in an already defined colour.                                                                          |
| `\cvlink{URL}{Label}`                          | A named hyperlink using the native typewriter contact-link style.                                                                          |
| `cvreferee{Name}{Position}{Email}{Website}`    | A full-width referee block with a bold name, small-capital position, and body fields below.                                                |
| `\cvaffiliation{Text}` and `\cvlocation{Text}` | Normal roman paragraph fields within a referee body. Repeat affiliations for multiple institutions.                                        |

Each `cvsection` and `cventry` ends its final paragraph cleanly. A referee stays on one page; breaks are allowed between referee environments. An empty position produces no trailing comma, and absent contacts produce no empty contact line or separator.

```tex
\begin{cvsection}[reserve=10]{Academic Referees}
  \begin{cvreferee}{Dr. Ada Example}{Lecturer}
    {ada@example.edu}{example.edu/ada}
    \cvaffiliation{Department of Computer Science, Example University}
    \cvlocation{Example City}
  \end{cvreferee}
\end{cvsection}
```

`\cvprofile{...}` declares named header fields. Supported keys are `name`, `position`, `institution`, `department`, `address`, `email`, `website`, `scholar`, `dblp`, `orcid`, `bib-given`, and `bib-family`. All fields except `name` may be omitted. `\makecvheader` expands the stored field values before calling the native header renderer, so initials, links and PDF author metadata use the actual name. ORCID and bibliography-name fields use the same state as `\cvorcid` and `\cvbibname`.

Profile calls update only the specified keys. Use `key={}` to clear a previously declared optional field. Keep names as plain text; `position` and `address` accept native line breaks. Personal profile data and publication-selection policy belong in the document, not the package.

`\cvpublicationcategory{Category}{Colour}{Keys}` declares a native BibLaTeX category, adds its comma-separated entry keys, and colours only its printed publication numbers. Repeating a category adds the new keys and updates its colour. If an entry belongs to multiple categories, the last registration determines its number colour. With no registrations, labels retain their normal black typewriter style. A document may still redeclare the native `labelnumberwidth` field format for a different presentation.

`\cvpublicationnote{EntryKey}{Text}` replaces that entry's printed `note` field while preserving its bibliography source. The first registration retains the current generic note format for notes without a replacement. Loading the package alone leaves native note formatting untouched. Re-registering a note updates its replacement; a later explicit `\DeclareFieldFormat{note}{...}` still takes precedence.

## Existing commands

- `\cvorcid{Identifier}` declares an optional linked ORCID, displayed on a separate typewriter line in the header. The nine-argument header API is unchanged.
- `\cvheader{Institution}{Department}{Address}{Name}{Position}{Email}{Website}{ScholarID}{DBLPID}` follows an institutional letterhead layout: a `\HUGE` regular-weight sans-serif name with the supplied capitalization at left above a thin rule; position and electronic contacts at left and institution/department/address at right below it. Optional fields may be empty. Use plain text for the name; the header automatically colors the first letter of its first and last space-separated words in the accent color. Middle words retain their normal color. The unformatted name sets the PDF author metadata. Website arguments accept either a complete HTTP(S) URL or a bare domain. Scholar and DBLP links display their service names, not raw identifiers.
- `\contactblock{Name}{Position}{Address}{Email}{Website}{ScholarID}{DBLPID}` preserves the previous seven-argument API. Use `\cvheader` for the complete institutional letterhead.
- `\cvbibname{GivenName}{FamilyName}` highlights the exact matching bibliography name in roman small capitals, using BibLaTeX’s name-formatting hooks. Keep author fields in the databases as plain names. No name is highlighted unless declared.
- `\details{Dates}{Role}{Institution}{Description}` places a wrapping role at left and dates at right, with the institution on the second line and the description below. Empty institution or description fields produce no blank line. Entries can break naturally after their opening lines.
- `\columndetails{Label}{Description}{RightText}` produces a compact row with an aligned short label, a wrapping description, and a short right-hand field in normal roman type. `\cvright{Text}` applies the same formatting to other right-aligned metadata.
- `\years{Text}` prints a right-aligned date on its own line. For a date beside an entry, use `\details` or put the date in the third argument of `\columndetails`.
- `\referals{Prefix}{GivenName}{FamilyName}{Role}{Organization}{Address}{Email}{Website}` formats one referee. The spelling and eight-argument signature are retained for existing users.
- `\refereerow{Name}{Details}{Email}{Website}` formats a full-width referee entry, with a bold name followed by a comma and the first detail line. Continuation lines and contacts start at the section's left edge. Email and website share a smaller contact line, separated by a centred dot when both are present. Details and either contact may be empty; a name without details has no trailing comma. Websites accept full HTTP(S) URLs or bare domains. Use `\newline` or paragraphs within details for flush-left continuation lines; each entry stays together, and page breaks are allowed between calls.
- `\finishcv{Date}{Website}` declares the update date and website for the actual last page, with the website at left and date at right, keeping the page number centered on every page. Declare it in the preamble. The native `lastpage` label identifies the final page after LaTeX reruns, so moving or adding content does not require moving this command. Run `latexmk` to settle page references.
- `refcolumns` places referee blocks in two columns. `ditemize` provides a compact two-column itemized list.

The `allowbreaks` option disables the small space reservation at the start of an entry. By default, entries reserve enough room for their opening lines; long descriptions can still cross a page boundary.

For horizontal referee entries, keep the layout in the package and the biographical text in the document. Names are bold; use the native `\cvlabel` helper for a position in roman small capitals, keeping affiliations and locations in normal roman text:

```tex
\section{Academic Referees}
\refereerow{Dr. Ada Example}
  {\cvlabel{Lecturer}\newline
   Department of Computer Science, Example University\newline Example City}
  {ada@example.edu}{example.edu/ada}
\refereerow{Prof. Alex Example}
  {\cvlabel{Research Director}\newline Example Institute\newline Another City}
  {}{https://example.edu/alex}
```

The existing `\referals` and `refcolumns` commands retain their vertical block and two-column layouts.

## Typography and Migration

Text and rules are black; name initials, hyperlinks, and authorship markers use the accent color. `accent=RoyalBlue4` selects an X11 color; omitting the option retains `SteelBlue4`. The option accepts colors or color expressions available through the loaded X11 xcolor configuration. URLs, email addresses, Scholar, DBLP, and ORCID use Computer Modern typewriter. Section headings use left-aligned uppercase bold sans-serif `\large` type between two full-width thin rules. Subsections use smaller `\small` uppercase bold sans-serif type with one 0.2pt rule below. Compact spacing separates headings and entries. Referee columns use a smaller outer gap. Right-aligned dates, compact metadata, and the final update date use normal upright roman type. The institution, department, and postal address use normal roman text while retaining right alignment. Publication titles are italic; author punctuation, venue details, and dates use the native numeric bibliography layout. Publication dates remain in the entries rather than a separate right-hand column.

Visible bibliography labels count down across all printed categories in typewriter font (`\texttt`) with square brackets, padded to at least two digits, such as `[09]` through `[01]`. The total is counted from loaded bibliography records; print every loaded record exactly once to obtain a complete descending sequence. This customization applies to the publication-list labels; inline citations retain the native numeric citation labels. Labels align with the heading’s left edge; the bibliography adds no extra space above or below the list. Original keys, sorting, author order, and source records are preserved. Deferred native numbering supports split categories without package warnings. ISBNs, ISSNs, and book-series names are omitted from the CV display; bibliography records retain those fields.

The native BibLaTeX `labelnumberwidth` field format controls the visible descending labels. Its default is `\texttt{[#1]}`. A document can redeclare that format to color publication numbers by category while retaining the default font and label width, independently of entry text and hyperlinks.

Version 5.0 removes `font=...`, `gfsdidot`, `libertinus`, `baskerville`, and `euler`. Remove obsolete font-selection and bare color options from existing documents; the supported color setting is now `accent=<color>`. The package no longer loads fontspec, unicode-math, custom font providers, marginnote, or PDF-version patches. Internal state and helpers use expl3; public commands and environments use the LaTeX document-command interface. Standard geometry, table, heading, and bibliography packages keep their native configuration APIs.

Mark records with `keywords = {randomized-authorship}` to append a parenthesized dagger in the accent color linked to the authorship explanation. Place `\cvauthorshiplegend` exactly once in that explanation to create its destination. `\cvrandomized` prints the linked marker elsewhere. Both commands keep the glyph outside italic title formatting.

`\cvlabel{Text}` sets an education or other item label in roman small capitals. `\&` uses only the upright Biolinum ampersand, including in sans-serif contexts and math mode. The local font selection leaves surrounding text and default fonts unchanged. TeX Live’s `libertine` font files supply this isolated glyph; the package does not load the Biolinum font package.

## Checks

The real CV checks pdfLaTeX/Biber integration and publication rendering. The fixture `tests/layout.tex` additionally covers both header signatures, omitted optional fields, long entry titles, compact rows, referee columns, the default roman/sans fonts, small-capital labels, the isolated text/math ampersand, right-aligned dates, and last-page footer placement in a two-page document. `tests/referee-rows.tex` covers horizontal rows, multiline details, empty fields, contact separators, website normalization, and page breaks between entries. `tests/structured-content.tex` covers the structured environments, named profile expansion and updates, category colours, note overrides and fallback, two bibliography groups with descending numbering, small-capital positions, empty referee fields, and existing command compatibility.

From the csLaTeX repository, use an external output directory:

```sh
mkdir -p /tmp/csresume-check
TEXINPUTS="$PWD/csresume:" latexmk -norc -pdf \
  -interaction=nonstopmode -halt-on-error \
  -outdir=/tmp/csresume-check csresume/tests/layout.tex
TEXINPUTS="$PWD/csresume:" latexmk -norc -pdf \
  -interaction=nonstopmode -halt-on-error \
  -outdir=/tmp/csresume-check csresume/tests/referee-rows.tex
TEXINPUTS="$PWD/csresume:" latexmk -norc -pdf \
  -interaction=nonstopmode -halt-on-error \
  -outdir=/tmp/csresume-check csresume/tests/structured-content.tex
```

Inspect the log for unresolved references, missing glyphs, and overfull boxes, then render and inspect the PDF. Rebuild the dependent CV after any output-affecting change.

## License

LaTeX Project Public License v1.3c.
