
DOT=$(wildcard *.dot)
PDF = $(DOT:.dot=.pdf)

.PHONY:all

all: $(PDF)

%.ps: %.dot
	dot -Tps $< -o $@

%.pdf: %.ps
	ps2pdf $<

clean:
	rm -f *~ *.ps *.pdf 



