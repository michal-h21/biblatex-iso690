SHELL := /bin/bash

.PHONY: build

doc_root = biblatex-iso690
doc_source = $(doc_root).tex
doc_file = $(doc_root).pdf
build_dir = build
dest_dir = $(build_dir)/$(doc_root)
dist_file = $(doc_root).zip

$(doc_file): $(doc_source)
	lualatex $(doc_root)
	biber $(doc_root)
	lualatex $(doc_root)

build:
	rm -rf $(build_dir)
	mkdir -p $(dest_dir)
	cp $(doc_source) $(doc_file) $(dest_dir)
	pushd $(build_dir)
	cd $(build_dir) && zip -r $(dist_file) $(doc_root)

style-guide.tex: biblatex-iso690.wiki/Style-Guide.md biblatex-iso690.wiki
	pandoc biblatex-iso690.wiki/Style-Guide.md -o style-guide.tex

biblatex-iso690.wiki/Style-Guide.md: biblatex-iso690.wiki
	pushd biblatex-iso690.wiki
	git pull origin master
	popd


biblatex-iso690.wiki:
	git clone https://github.com/michal-h21/biblatex-iso690.wiki.git

