
alias c := convert

convert:
    typst compile slides.typ public/slides.pdf
    
w:
    typst watch slides.typ public/slides.pdf 

i:
    typst init @preview/metropolis-polylux hurl