FILES_eps:=$(wildcard *.eps)
FILES_pdf=$(FILES_eps:.eps=.pdf)

pdf: $(FILES_pdf)

%.pdf: %.eps
	epstopdf $^