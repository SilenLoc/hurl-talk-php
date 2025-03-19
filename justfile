
alias c := convert

convert:
    typst compile slides.typ public/slides.pdf

i:
    typst init @preview/metropolis-polylux hurl