# Style ISO 690 for biblatex

Biblatex is bibliography and citation tool for LaTeX. This project provides
support for citations in ISO 690 style.  As the norm is a little bit ambiguous
in some details regarding formatting of records, we largely follow
requirements of Czech interpretation, as it is required form in many Czech
universities. Style can be used in other languages as well, of course.

## Install
Open the terminal and find location of your TEXMFHOME directory with this command.

    kpsewhich -var-value TEXMFHOME
    
Open this directory using and check that directory `$TEXMFHOME/tex/latex` exists. 
If it doesn't exist, you must create it. You can do this from the
command line or using a file manager.  Open the `$TEXMFHOME/tex/latex` directory and either
run command 

    git clone git@github.com:michal-h21/biblatex-iso690.git

or unzip file

    https://github.com/michal-h21/biblatex-iso690/archive/master.zip

here. You should be able to use **biblatex-iso690** now.

## Usage

```
...
\usepackage[english,czech]{babel} % main language of the document must be last
\usepackage[
   backend=biber        % if we want unicode 
  ,style=iso-authoryear % or iso-numeric for numeric citation method          
  ,autolang=other       % to support multiple languages in bibliography
  ,sortlocale=cs_CZ     % locale of main language, it is for sorting
  ,bibencoding=UTF8     % this is necessary only if bibliography file is in different encoding than main document
]{biblatex}
... 
```

Custom options:
  spacecolon 
    add space before colon in publisher and title:
      [true]  Praha : Academia
      [false] Praha: Academia 

Bibliographic fields:
Some fields have different meaning than in plain BibTeX.

 1. if publication is written in other language than the main document is, it should have filled "langid" field
  
  langid = {czech}

 2. publications with online versions should have "urldate" field. it is date when you last checked publication online

  urldate = {2011-01-12},

 3. if publication has more isbn or issn numbers, use just one of them

 4. publisher and place
 
  location = {Praha},  
  publisher = {Academia}
  
For more details see file [mybib.bib](https://github.com/michal-h21/biblatex-iso690/blob/master/mybib.bib)


### License

GNU/GPL 3
