ISO 690 style for biblatex
==========================

Biblatex is a bibliography and citation tool for LaTeX. This project provides
support for citations in ISO 690 style. As the standard is a little bit ambiguous
in some details regarding formatting of records, we largely follow
requirements of Czech interpretation, as it is required form in many Czech
universities. The style can be used in other languages as well, of course.

Install
-------

Open the terminal and find location of your `TEXMFHOME` directory with this command:

    kpsewhich -var-value TEXMFHOME

Open this directory and check that the directory `$TEXMFHOME/tex/latex` exists.
If it doesn't exist, you must create it. You can do this from the
command line or using a file manager. Open the `$TEXMFHOME/tex/latex` directory and either
run the command

    git clone git@github.com:michal-h21/biblatex-iso690.git

or unzip the file

    https://github.com/michal-h21/biblatex-iso690/archive/master.zip

here. You should be able to use biblatex-iso690 now.

Usage:
------
```
\usepackage[english,czech]{babel} % main language of the document must be last
\usepackage[
   backend=biber        % if we want unicode
  ,style=iso-authoryear % or iso-numeric for numeric citation method
  ,autolang=other       % to support multiple languages in bibliography
  ,sortlocale=cs_CZ     % locale of main language, for sorting
  ,bibencoding=UTF8     % this is necessary only if bibliography file is in different encoding than main document
]{biblatex}
```

### Custom options
* **spacecolon**
  add space before colon in publisher and title:
  * **[true]**  Praha : Academia
  * **[false]** Praha: Academia

### Bibliographic fields
Some fields have a different meaning than in plain BibTeX.

1\. If the publication is written in a different language to the main document, it should have a filled `langid` field.
```
langid = {czech}
```

2\. Publications with online versions should have a `urldate` field. It is the date when you last checked the publication online.
```
urldate = {2011-01-12}
```

3\. If the publication has more than one ISBN or ISSN number, use just one of them.

4\. Publisher and place:
```
location = {Praha},
publisher = {Academia}
```

For more details see the file `mybib.bib`.

License
-------
GNU/GPL 3
