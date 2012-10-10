TEMPLATE=template-ktikz.pgs
TEMP=temp.tex

# source files
TIKZ=$(wildcard *.tikz)
PDF=$(TIKZ:.tikz=.pdf)

# files to update
UPDF=$(wildcard *.pdf)


.PHONY:all pdf update updf 

#files that need to compile chapter before
SPDF=du-1.pdf du-2.pdf web-1.pdf web-2.pdf web-3.pdf
OPDF=double-diamond-1.pdf double-diamond-2.pdf pruned-1.pdf pruned-2.pdf
all: $(SPDF) double-diamond-1.pdf double-diamond-2.pdf pruned-1.pdf pruned-2.pdf



# WARNING!!
#
# For the 'du-*.pdf' figures, we use 'remember picture' so it does work
# directly. We need to 
# 1- generate the whole chapter (with \dousetikz) to get coordinates right
# 2- generate only the figure as done below
#
# => this must be done for each du-[12].pdf figure (do not skip 1-!)
#
# use force to do it automatically


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
$(SPDF):%.pdf: 
	cd ../ && rm chapter.aux && pdflatex '\def\dousetikz{} \input{chapter}'
	cd ../ && pdflatex --jobname=tikz/$* '\def\dousetikz{} \input{chapter}' && rm chapter.aux
$(OPDF):%.pdf: 
	cd ../ && pdflatex --jobname=tikz/$* '\def\dousetikz{} \input{chapter}'


clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *~

clean-all: clean
	rm -f *.pdf *.eps
