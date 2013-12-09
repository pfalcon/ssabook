figs= scheme code codeCFG scheme_iterated scheme_chaitin #codeSSA furthest dynamic trous spill_everywhere

all: $(figs) 

%: %.fig
	./figslides $^
	touch $@
clean:
	@for f in $(figs) ; do \
	  echo removing $$f ; \
	  rm -f $$f ; \
	  for n in $${f}_*-*.fig ; do \
	    echo removing $$n ; \
	    rm -f $$n ; \
	  done ; \
	done
	@rm -f *.pdftex*
