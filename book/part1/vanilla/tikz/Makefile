TEMPLATE=template-ktikz.pgs
TEMP=temp.tex

# source files
TIKZ=$(wildcard *.tikz)
PDF=$(TIKZ:.tikz=.pdf)

# files to update
UPDF=$(wildcard *.pdf)


.PHONY:all pdf update updf 

#files that need to compile chapter before
SPDF=
#the other ones
OPDF=zero-1.pdf zero-2.pdf

all: $(SPDF) $(OPDF) ifthenelse-nonssa.pdf ifthenelse-ssa.pdf while.pdf 

ifthenelse-ssa.tikz: ifthenelse.tikz
	echo '\\def\\num{2}\n\\input{ifthenelse.tikz}' > ifthenelse-ssa.tikz
	# cat ifthenelse.tikz >> ifthenelse-ssa.tikz
ifthenelse-nonssa.tikz: ifthenelse.tikz
	echo '\\def\\num{1}\n\\input{ifthenelse.tikz}' > ifthenelse-nonssa.tikz
	# cat ifthenelse.tikz >> ifthenelse-nonssa.tikz

#all: updf

updf: $(UPDF)

update: updf ueps

pdf: $(PDF)

eps: $(EPS)


%.pdf: %.tikz
	cd ../ && pdflatex --jobname=tikz/$* '\def\dousetikz{} \input{chapter}'


# for subfigures
# $(SPDF) $(OPDF): %-1.pdf: %.stikz
# $(SPDF) $(OPDF): %-2.pdf: %.stikz
# $(SPDF) $(OPDF): %-3.pdf: %.stikz
$(SPDF): %.pdf: $< 
	cd ../ && rm -f chapter.aux && pdflatex '\def\dousetikz{} \input{chapter}'
	cd ../ && pdflatex --jobname=tikz/$(basename $@ .pdf) '\def\dousetikz{} \input{chapter}' && rm -f chapter.aux
$(OPDF):%.pdf: $<
	cd ../ && pdflatex --jobname=tikz/$(basename $@ .pdf) '\def\dousetikz{} \input{chapter}'


clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *~

clean-all: clean
	rm -f *.pdf *.eps
