#!/bin/bash

# Builds all the chapters and parts as PDFs, and moves them to
# pdfs/chapter_name.pdf. If an argument is provided, it moves them to
# pdf/chapter_nameARGS.pdf.

for i in `scripts/all_targets.sh`; do

	echo $i;
	make -C $i;
	BASENAME=`basename $i`

	# Move part.pdf, if it exists.
	if [ -e $i/part.pdf ]; then
		cp "$i/part.pdf" "pdfs/$BASENAME$@.pdf"
	fi

	# Move chapter.pdf, if it exists.
	if [ -e $i/chapter.pdf ]; then
		cp "$i/chapter.pdf" "pdfs/$BASENAME$@.pdf"
	fi

done

# Move book.pdf, if it exists.
if [ -e book.pdf ]; then
	cp "book.pdf" "pdfs/book.pdf"
fi


