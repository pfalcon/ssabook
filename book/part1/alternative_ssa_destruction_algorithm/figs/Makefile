FIGFILES=$(wildcard *.fig)
PDFTEXFILES=$(FIGFILES:.fig=)
FILES_PDFTEX=$(addsuffix .pdftex,$(PDFTEXFILES))
FILES_PDFTEX_T=$(addsuffix .pdftex_t,$(PDFTEXFILES))
PDFFILES=$(FIGFILES:.fig=.pdf)

all: $(PDFFILES)

%.pdftex: %.fig
	fig2dev -L pdftex $< > $@

%.pdftex_t: %.pdftex %.fig 
	fig2dev -L pdftex_t -p $*.pdftex $*.fig > $@

%.pdf: %.pdftex %.pdftex_t
	pdflatex --jobname=$* fig2figure
	mv $*.pdf /tmp/
	pdfcrop /tmp/$*.pdf $*.pdf

clean-all: clean clean-fig

clean: 
	-rm -f *.bak *.aux *.dvi *.log 

clean-fig:
	-rm -f *.pdftex *.pdftex_t *.pdf
