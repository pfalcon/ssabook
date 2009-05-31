#!/bin/bash

set -x

# Are we in the right directory?
PWD=`pwd`
if [[ "xbook" != x`basename $PWD` ]]; then
	echo "Wrong directory: $PWD (should be in book)"
	exit 1
fi

# Build the PDFs
scripts/collate.sh


# Rsync it online
rsync --delete -arLz $PWD/pdfs/* scm.gforge.inria.fr:/home/groups/ssabook/htdocs/latest/
