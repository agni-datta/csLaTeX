---
title: Coloured Theorem Environments for Computer Science (`cscolorthm.sty`)
linter-yaml-title-alias: Coloured Theorem Environments for Computer Science (`cscolorthm.sty`)
date created: Wednesday, April 17th 2024, 14:56:05
date modified: Thursday, January 30th 2025, 16:28:02
aliases: Coloured Theorem Environments for Computer Science (`cscolorthm.sty`)
---

# Coloured Theorem Environments for Computer Science (`cscolorthm.sty`)

The `cscolorthm` package provides a comprehensive collection of coloured theorem environments and proof environments utilizing the powerful capabilities of the `tcolorbox` package. It offers a versatile solution for typesetting theorems, lemmas, corollaries, propositions, claims, conjectures, definitions, examples, remarks, facts, notes, questions, cases, exercises, problems, properties, solutions, important points, key-points, and highlights with customizable colour schemes.

**Author:** Agni Datta  
**Version:** 1.0  
**Date:** 2024/03/25

## Package Overview

- Provides coloured theorem environments and proof environments.
- Utilizes the `tcolorbox` package for customizable box styling.
- Supports various theorem-like environments including theorems, lemmas, corollaries, propositions, claims, conjectures, definitions, examples, remarks, facts, notes, questions, cases, exercises, problems, properties, solutions, important points, keypoints, and highlights.
- Offers a range of soothing colour schemes for visually appealing typesetting.
- Includes hyperlinks for cross-referencing theorem environments.
- Supports AMS theorem package functionalities for mathematical typesetting.
- Provides intuitive proof environments for various purposes.

## Usage

1. Load the package in the preamble of your LaTeX document:

```latex
\usepackage{cscolorthm}
```

1. After loading the package, you can directly use the predefined coloured theorem environments and proof environments in your document.

## Available Theorem Environments

The `cscolorthm` package provides the following coloured theorem environments:

- Theorem
- Lemma
- Corollary
- Proposition
- Claim
- Conjecture
- Definition
- Example
- Remark
- Fact
- Note
- Question
- Case
- Exercise
- Problem
- Property
- Solution
- Important
- Keypoint
- Highlight

Each environment comes with its own distinctive colour scheme to enhance readability and visual appeal.

## Proof Environments

The package defines proof environments for various purposes:

- `proof`: Standard proof environment.
- `proofSketch`: Sketch of Proof.
- `proofIdea`: Proof Idea.
- `proofOfLemma`: Proof of Lemma.
- `proofAttempt`: Proof Attempt.
- `proofOf`: Proof of a specific statement.

## Customization

Users can customize the appearance of theorem environments by adjusting the colour schemes and box styling parameters within the package file.

## Dependencies

- `etoolbox`: For conditional statements.
- `xcolor`: For support of colour.
- `amsthm`: AMS theorem package.
- `amsmath`: AMS math package.
- `amssymb`: AMS symbols package.
- `tcolorbox`: Custom lists and box styling.
- `enumitem`: Custom lists.
- `hyperref`: Hyperlinks.
- `cleveref`: Clever cross-referencing.

## Example

```latex
\documentclass{article}
\usepackage{cscolorthm}

\begin{document}

\begin{theorem}{Pythagorean Theorem}{blue}{blue}
    In a right triangle, the square of the length of the hypotenuse is equal to the sum of the squares of the lengths of the other two sides.
\end{theorem}

\begin{proof}
    The proof follows directly from the definition of a right triangle and the Pythagorean theorem.
\end{proof}

\end{document}
```
