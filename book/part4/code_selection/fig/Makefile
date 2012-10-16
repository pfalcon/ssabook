TEMPLATE=template-ktikz.pgs
TEMP=temp.tex

# source files
TIKZ=$(wildcard *.tikz)
PDF=$(TIKZ:.tikz=.pdf)

# files to update
UPDF=$(wildcard *.pdf)

.PHONY:all pdf update updf 

all: pdf

updf: $(UPDF)

update: updf ueps

pdf: $(PDF)

eps: $(EPS)

%.pdf: %.tikz 
	pdflatex --jobname=$* tikz2figure

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *~

clean-all: clean
	rm -f *.pdf *.eps
