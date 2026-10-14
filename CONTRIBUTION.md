---
title: CONTRIBUTION
aliases: CONTRIBUTION
linter-yaml-title-alias: CONTRIBUTION
date created: Monday, October 12th 2026, 12:22:57 am
date modified: Wednesday, October 14th 2026, 3:27:53 am
---

## Contributing to csLaTeX

Read the package guide and keep changes within that package’s purpose. Csmath handles shared mathematics and fonts, csthm handles theorems and proofs, codelines handles pseudocode lines, and csdeferproofs handles deferred proofs. Eudoxus is a separate mathematical framework.

Preserve public command names and arguments unless a change has been agreed. Use lowercase option names with hyphens between words. Unknown options and conflicting settings should give useful errors. Load optional dependencies only when their features are selected.

Keep definitions grouped under 80-character comment banners. Use compact definitions for simple commands and indented blocks for longer ones. Package guides should explain usage, options and commands in plain language.

Compile affected examples with the supported engines before committing. Check logs for errors, missing characters, font substitutions, unresolved references and overfull boxes. Repeat runs when references or theorem end marks need them, and inspect the PDF. Keep build files outside the source tree.

Update the package version and guide when behavior changes, and update the root package table as needed. Keep author notices and LPPL attribution. Commit changes in small groups so they can be reviewed and reverted separately.
