TEMPLATE=template-ktikz.pgs
TEMP=temp.tex

# source files
TIKZ=$(wildcard *.tikz)
PDF=$(TIKZ:.tikz=.pdf)

# files to update
UPDF=$(wildcard *.pdf)

.PHONY:all pdf update updf 

all: du-1.pdf du-2.pdf double-diamond-1.pdf double-diamond-2.pdf pruned-1.pdf pruned-2.pdf

#all: updf

updf: $(UPDF)

update: updf ueps

pdf: $(PDF)

eps: $(EPS)

# %.pdf: %.tikz 
#         pdflatex --jobname=$* tikz2figure
#         pdfcrop --verbose $*.pdf /tmp/t.pdf
#         mv /tmp/t.pdf $*.pdf


### simpler rules for the book for figure and subfigure generation
# for figures
%.pdf: %.tikz
	cd ../ && pdflatex --jobname=tikz/$* '\def\dousetikz{} \input{chapter}'


# for subfigures
%-1.pdf: %.stikz
	cd ../ && pdflatex --jobname=tikz/$*-1 '\def\dousetikz{} \input{chapter}'

%-2.pdf: %.stikz
	cd ../ && pdflatex --jobname=tikz/$*-2 '\def\dousetikz{} \input{chapter}'

%-3.pdf: %.stikz
	cd ../ && pdflatex --jobname=tikz/$*-3 '\def\dousetikz{} \input{chapter}'


clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *~

clean-all: clean
	rm -f *.pdf *.eps
