#!/bin/bash

# Print out all directories which can be built.


echo "."

for i in `cat PARTS`; do
	echo $i/
	for j in `cat $i/CHAPTERS`; do
		echo $i/$j
	done
done
