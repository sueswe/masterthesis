#!/bin/bash


function usage() {
    echo "Usage:"
    echo "$0 [--install] [tex-Datei]"
}

if [[ $1 == '-?' ]]; then
  usage
  exit 0
fi

i=$1
if [[ $i == '--install' ]]; then
  sudo apt-get install texlive-fonts-extra texlive-latex-recommended
  sudo apt install texlive-lang-german
  sudo apt install texlive-latex-extra
  exit 0
fi

f=$1
if [[ ! -e $f ]]; then
  echo "File $f not found."
  exit 3
fi
pdflatex -halt-on-error $f
exit $?
 
