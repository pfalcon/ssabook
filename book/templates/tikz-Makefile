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


##
# Old way, using tikz2figure
##
# %.pdf: %.tikz 
#         pdflatex --jobname=$* tikz2figure
#         pdfcrop --verbose $@ /tmp/t.pdf
#         mv /tmp/t.pdf $@


# Functions for figure externalization from tikz
# actually, no need for gen-subfig as this is handled in the LaTeX file, but 
# keeping it anyways for reference
define gen-fig
   cd ..; pdflatex --jobname=tikz/$* "\def\dousetikz{} \input{chapter}"
endef
define gen-subfig
   echo first arg is $(1)
#    cd ..; pdflatex --jobname=tikz/$* "\def\dousetikz{} \def\ver={$(1)} \input{chapter}"
endef


%.pdf:
	$(call gen-fig)


# This rules check if the file is of the form
#   file-X.pdf
# ⇒ this is for tikz files used for multiple figures, depending on the value of 
#   the \ver macro, the value is extracted using the shell substitution #*- on $*
# ⇒ otherwise, just call the regular figure generator
# 
# ⇒ Actually, LaTeX handles the suffix stuff, so not used anymore, but kept for 
# reference
#
# %.pdf:
#         $(if $(suffix $*), \
#            $(call gen-fig), \
#            $(call gen-subfig,$${x#*-}))

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *~

clean-all: clean
	rm -f *.pdf *.eps
