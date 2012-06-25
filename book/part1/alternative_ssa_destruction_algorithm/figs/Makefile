FIGFILES=$(wildcard *.fig)
PDFTEXFILES=$(FIGFILES:.fig=)
FILES_PDFTEX=$(addsuffix .pdftex,$(PDFTEXFILES))
FILES_PDFTEX_T=$(addsuffix .pdftex_t,$(PDFTEXFILES))

all: $(FILES_PDFTEX_T) $(FILES_PDFTEX) 

%.pdftex: %.fig
	fig2dev -L pdftex $< > $@

%.pdftex_t: %.pdftex %.fig 
	fig2dev -L pdftex_t -p $*.pdftex $*.fig > $@

clean-all: clean clean-fig

clean: 
	-rm -f *.bak *.aux *.dvi *.log 

clean-fig:
	-rm -f *.pdftex *.pdftex_t
