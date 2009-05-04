#!/bin/bash

# Build the book, all parts, and all chapters. If an argument is passed, it is
# passed to make. Run 'make help' to see useful options (in particular "clean",
# "purge" and "ps" are very useful).


for i in `scripts/all_targets.sh`; do make -C $i $@; done
