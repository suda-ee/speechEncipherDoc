#!/bin/sh
~/.cabal/bin/pandoc --template template.tex --latex-engine=xelatex --toc \
    -V fontsize=12pt -V papersize=a4paper \
    -V documentclass=article -V toc-depth=3 \
    -V geometry="scale={.75,.8},top=3cm" -N \
    $@
