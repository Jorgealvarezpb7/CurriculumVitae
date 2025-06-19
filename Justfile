default:
  just --list

# Builds Documentation into PDF
build:
  docker run --rm -it -v $(pwd):/workdir danteev/texlive latexmk -pdf ./src/main.tex
