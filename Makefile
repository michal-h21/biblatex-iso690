SHELL := /bin/bash

.PHONY: build clean

doc_root = biblatex-iso690
doc_source = $(doc_root).tex
doc_file = $(doc_root).pdf
build_dir = build
tds_dest_dir = $(build_dir)/tex/latex/$(doc_root)
tds_doc_dest_dir = $(build_dir)/doc/latex/$(doc_root)

dest_dir = $(build_dir)/$(doc_root)
doc_dest_dir = $(dest_dir)
dist_file = $(doc_root).zip
tds_dist_file = $(doc_root).tds.zip

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
	@rm -rf $(tds_build_dir)
	@mkdir -p $(tds_dest_dir)
	@mkdir -p $(tds_doc_dest_dir)
	@mkdir -p $(dest_dir)
	@mkdir -p $(doc_dest_dir)
	@cp  $(bbx) $(cbx) $(lbx) $(dbx) $(dest_dir)
	@cp README.md $(doc_source) $(doc_file) $(bib_file)  $(doc_dest_dir)
	@cp  $(bbx) $(cbx) $(lbx) $(dbx) $(tds_dest_dir)
	@cp README.md $(doc_source) $(doc_file) $(bib_file)  $(tds_doc_dest_dir)
	@cd $(build_dir) && zip -r $(tds_dist_file) tex doc
	@cp $(build_dir)/$(tds_dist_file) $(dest_dir)
	@cd $(build_dir) && zip -r $(dist_file) $(doc_root)
	

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
