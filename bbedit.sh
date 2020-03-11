#!/bin/bash
PATH=$PATH:/usr/local/bin
cd "$(dirname "$BB_DOC_PATH")"
pandoc -f markdown "${BB_DOC_PATH}" -o "${BB_DOC_PATH%%.*}".html -t revealjs -s --filter=/usr/local/bin/pandoc-citeproc --bibliography biblio.bib --csl apa-fr.csl -c prez.css -V revealjs-url=reveal.js -V history=false -V theme=white -V transition=none
open "${BB_DOC_PATH%%.*}".html