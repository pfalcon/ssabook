# source files
TIKZ=$(wildcard *.tikz)
PDF=$(TIKZ:.tikz=.pdf)

.PHONY:all 

all: pdf

pdf: $(PDF)

%.pdf: %.tikz tikz2figure.tex
	pdflatex --jobname=$* tikz2figure
	pdfcrop --verbose $*.pdf /tmp/t.pdf
	mv /tmp/t.pdf $*.pdf

clean:
	rm -f *.aux *.log *~ *.out

