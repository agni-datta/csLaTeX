#!/usr/bin/env python3
"""fmt.py — Normalize indentation in all .sty and .tex files.

Converts every tab character to 4 spaces. Run from the repo root:
    python3 fmt.py
"""

import os
import sys

TABSIZE   = 4
EXTS      = {'.sty', '.tex', '.cls'}
SKIP_DIRS = {'.git', '__pycache__'}


def fmt_file(path: str) -> bool:
    """Expand tabs in *path* in-place. Returns True if the file changed."""
    raw = open(path, 'rb').read()
    if b'\t' not in raw:
        return False
    text     = raw.decode('utf-8', errors='replace')
    expanded = '\n'.join(line.expandtabs(TABSIZE) for line in text.split('\n'))
    open(path, 'wb').write(expanded.encode('utf-8'))
    return True


def main() -> None:
    root    = os.path.dirname(os.path.abspath(__file__))
    changed = []
    skipped = []

    for dirpath, dirs, files in os.walk(root):
        dirs[:] = sorted(d for d in dirs if d not in SKIP_DIRS)
        for fname in sorted(files):
            ext = os.path.splitext(fname)[1].lower()
            if ext not in EXTS:
                continue
            fpath   = os.path.join(dirpath, fname)
            relpath = os.path.relpath(fpath, root)
            if fmt_file(fpath):
                changed.append(relpath)
            else:
                skipped.append(relpath)

    for p in changed:
        print(f'  formatted : {p}')
    for p in skipped:
        print(f'  unchanged : {p}')

    print(f'\n{len(changed)} file(s) reformatted, {len(skipped)} already clean.')


if __name__ == '__main__':
    main()
