---
title: CONTRIBUTION
aliases: CONTRIBUTION
linter-yaml-title-alias: CONTRIBUTION
date created: Thursday, May 14th 2026, 10:21:20 pm
date modified: Tuesday, June 23rd 2026, 8:36:43 pm
---

<!-- @format -->

## Contributing to csLaTeX

### Reporting issues

Open a GitHub issue with a minimal reproducing example, the TeX engine and distribution version, and the exact error or unexpected behaviour.

### Submitting changes

1. Fork the repository and create a branch from `main`.
2. Make your changes in the relevant package subdirectory.
3. Ensure the package compiles without errors under the target engine(s) declared in the package header.
4. Update the `\ProvidesPackage` date and version if you modified a `.sty` or `.cls` file.
5. Update the package `README.md` if the change affects documented behaviour.
6. Add an entry to the root `CHANGELOG.md`.
7. Open a pull request with a concise title and a description of what changed and why.

### Code standards

- Format `.sty` files with `latexindent` before committing.
- Use `\NewDocumentCommand` / `\NewDocumentEnvironment` (xparse) for new public interfaces.
- Declare all dependencies with `\RequirePackage`; do not use `\usepackage` inside a package.
- Mark internal macros with a package-specific prefix (e.g. `\csthm@…`).
- Do not load packages that are not required for the contributed feature.

### Licensing

By submitting a pull request you agree to license your contribution under the LaTeX Project Public License v1.3c.

### Contact

Agni Datta—`agnidatta.org@gmail.com`
