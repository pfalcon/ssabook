# source files
TIKZ=$(wildcard *.tikz)
PDF=$(TIKZ:.tikz=.pdf)

.PHONY:all 

all: pdf

pdf: $(PDF)

%.pdf: %.tikz 
	pdflatex --jobname=$* tikz2figure

clean:
	rm -f *.aux *.log *.pdf *~

