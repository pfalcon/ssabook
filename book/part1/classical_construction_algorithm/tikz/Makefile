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

%.ps: %.dvi
	dvips -o $@ $<

%.eps: %.ps
	ps2eps $<

%.dvi: %.tikz 
	latex --jobname=$* tikz2figure

%.pdf: %.tikz 
	pdflatex --jobname=$* tikz2figure
	pdfcrop --verbose $@ /tmp/t.pdf
	mv /tmp/t.pdf $@

%-1.pdf: %.tikz 
	pdflatex --jobname=$* '\def\ver{1} \input{tikz2figure}'
	pdfcrop --verbose $*.pdf /tmp/t.pdf
	mv /tmp/t.pdf $@

%-2.pdf: %.tikz 
	pdflatex --jobname=$* '\def\ver{2} \input{tikz2figure}'
	pdfcrop --verbose $*.pdf /tmp/t.pdf
	mv /tmp/t.pdf $@

%-3.pdf: %.tikz 
	pdflatex --jobname=$* '\def\ver{3} \input{tikz2figure}'
	pdfcrop --verbose $*.pdf /tmp/t.pdf
	mv /tmp/t.pdf $@

%-4.pdf: %.tikz 
	pdflatex --jobname=$* '\def\ver{4} \input{tikz2figure}'
	pdfcrop --verbose $*.pdf /tmp/t.pdf
	mv /tmp/t.pdf $@

%-5.pdf: %.tikz 
	pdflatex --jobname=$* '\def\ver{5} \input{tikz2figure}'
	pdfcrop --verbose $*.pdf /tmp/t.pdf
	mv /tmp/t.pdf $@

%-6.pdf: %.tikz 
	pdflatex --jobname=$* '\def\ver{6} \input{tikz2figure}'
	pdfcrop --verbose $*.pdf /tmp/t.pdf
	mv /tmp/t.pdf $@

###
## Trying to factorize without success
###
# %.pdf:
# ifneq "$(strip $(suffix $*))" ".1"
# 	echo null suff $* $(suffix $*)
# else
# 	echo exists suff $* $(suffix $*)
# endif


clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *~

clean-all: clean
	rm -f *.pdf *.eps
