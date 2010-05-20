PDF=constprop_lattice.pdf contr_flow_graph.pdf ssa_graph.pdf ssa_propagation.pdf\
    copy_propagation.pdf copy_propagation_loop.pdf

all: $(PDF)

%.pdf: %.pgf tikz2pdf.tex
	pdflatex --jobname=$* tikz2pdf.tex

clean:
	rm -f $(PDF)
