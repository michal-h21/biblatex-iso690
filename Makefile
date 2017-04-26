SHELL := /bin/bash

.PHONY: build clean

doc_root = biblatex-iso690
doc_source = $(doc_root).tex
doc_file = $(doc_root).pdf
build_dir = build
dest_dir = $(build_dir)/tex/latex/$(doc_root)
doc_dest_dir = $(build_dir)/doc/latex/$(doc_root)

dist_file = $(doc_root).zip
bib_file = mybib.bib
bbx = $(wildcard *.bbx)
cbx = $(wildcard *.cbx)
lbx = $(wildcard *.lbx)
dbx = $(wildcard *.dbx)
aux_files = $(doc_root).aux $(doc_root).bbl $(doc_root).bcf \
			$(doc_root).blg $(doc_root).log $(doc_root).out \
			$(doc_root).run.xml $(doc_root).toc


$(doc_file): $(doc_source)
	pdflatex $(doc_root)
	biber $(doc_root)
	pdflatex $(doc_root)

build: $(doc_source) $(doc_file) $(bbx) $(cbx) $(lbx)
	@rm -rf $(build_dir)
	@mkdir -p $(dest_dir)
	@mkdir -p $(doc_dest_dir)
	@cp  $(bbx) $(cbx) $(lbx) $(dbx) $(dest_dir)
	@cp README.md $(doc_source) $(doc_file) $(bib_file)  $(doc_dest_dir)
	@cd $(build_dir) && zip -r $(dist_file) tex doc

style-guide.tex: biblatex-iso690.wiki/Style-Guide.md biblatex-iso690.wiki
	pandoc biblatex-iso690.wiki/Style-Guide.md -o style-guide.tex

biblatex-iso690.wiki/Style-Guide.md: biblatex-iso690.wiki
	pushd biblatex-iso690.wiki
	git pull origin master
	popd


biblatex-iso690.wiki:
	git clone https://github.com/michal-h21/biblatex-iso690.wiki.git

clean:
	-rm $(aux_files)
