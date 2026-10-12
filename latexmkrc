# Safe repository defaults; authors select another engine with latexmk -lualatex/-xelatex.
$pdf_mode = 1;
$pdflatex = 'pdflatex -no-shell-escape -interaction=nonstopmode -halt-on-error -recorder %O %S';
$lualatex = 'lualatex -no-shell-escape -interaction=nonstopmode -halt-on-error -recorder %O %S';
$xelatex = 'xelatex -no-shell-escape -interaction=nonstopmode -halt-on-error -recorder %O %S';
$max_repeat = 5;
# No automatic custom R, glossary, indexing, figure-conversion or PDF-rewrite jobs.
# No deletion extension list containing PDFs, bibliography sources or backups.
# BibTeX/Biber retain latexmk's ordinary document-driven behavior.
