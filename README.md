# Biblatex style for ISO 690 standard

`biblatex` is a bibliography and citation tool for LaTeX. This project provides
support for citations in ISO 690 style. As the standard is a little bit
ambiguous in some details regarding formatting of records, we largely follow
requirements of Czech interpretation, as it is required form in many Czech
universities. The style can be used in other languages as well, of course.

## Installation

The package is included in MikTeX and TeX Live distributions since 2016, so it
could be shipped with your TeX installation.

It is also available on CTAN as `biblatex-iso690`:

https://www.ctan.org/pkg/biblatex-iso690

### Install from GitHub

Open the terminal and find location of your `TEXMFHOME` directory with this
command:

    kpsewhich -var-value TEXMFHOME

Open this directory and check that the directory `$TEXMFHOME/tex/latex`
exists. If it doesn't exist, you must create it. You can do this from the
command line or using a file manager. Open the `$TEXMFHOME/tex/latex`
directory and either run the command

    git clone git@github.com:michal-h21/biblatex-iso690.git

or unzip the file

    https://github.com/michal-h21/biblatex-iso690/archive/master.zip

here. You should be able to use `biblatex-iso690` now.

## Usage

```latex
\usepackage[english,czech]{babel} % the main document language is the last one
\usepackage[
  backend=biber,        % if we want unicode and many other features (biber is already by default)
  style=iso-authoryear, % or another iso-<style>
]{biblatex}
```

### Citation and bibliography styles

`biblatex-iso690` provides the following styles (both for citations
and bibliographies). You can select one with `style` keyword in the
package options of `biblatex`.

* `iso-alphabetic`
* `iso-authortitle`
* `iso-authoryear`
* `iso-numeric`

### Custom options

Above and beyond the scope of package options provided by `biblatex` itself,
here are also some more. Default values are in **bold**.

* `spacecolon`
  add space before colon in publisher and title (and also title and subtitle):
  *   [true]    Praha : Academia
  * **[false]** Praha: Academia
* `pagetotal`
  print out total number of pages as an additional information in the notes section:
  *   [true]    Praha: Academia, 2008 [60 p.]
  * **[false]** Praha: Academia, 2008
* `shortnumeration`
  visually distinguish numeration and pagination section:
  *   [true]    ... 2011, **32**(3), 289–301 [visited on 2016-05-14] ...
  * **[false]** ... 2011, vol. 32, no. 3, pp. 289–301 [visited on 2016-05-14] ...
* `thesisinfoinnotes`
  print out thesis information in notes section
  * **[true]** Available from: <...>. BP. MU, FI, Brno. Supervised by Petr SOJKA
  *   [false]  BP. MU, FI, Brno. Supervised by Petr SOJKA. Available from: <...>
* `doi`
  enable or disable printing of the DOI number
  * **[true]** Available from DOI: [10.5300/2016-1-4/106](https://doi.org/10.5300/2016-1-4/106)
  *   [false] --
* `isbn`
  enable or disable printing of the ISBN, ISSN and other standard identifiers
  * **[true]** ISBN 0-201-36299-6
  *   [false] --
* `eprint`
  enable or disable printing of the eprint field
  * **[true]** Available from arXiv: 1905.10545
  *   [false] --
* `url`
  enable or disable printing of the URL (this option also affects the printing
  of `[online]` medium designation for electronic resources other than
  `@online` entry type)
  * **[true]** Available from: <https://github.com/michal-h21/biblatex-iso690>
  *   [false] --
* `articlepubinfo`
  enable or disable printing publication information (`location` and
  `publisher` fields) for an `@article` entry type
  *   [true]    Journal of Money, Credit and Banking. Ohio State University Press, vol. 38, no. 1, pp. 119–140.
  * **[false]** Journal of Money, Credit and Banking. Vol. 38, no. 1, pp. 119–140.
* `currentlang`
  print localization bibliography strings in the currently selected language
  *   [true]    `context dependent`
  * **[false]** `context dependent`
* `noenddot`
  enable or disable printing an end dot at the very end of
  bibliography entries
  *   [true]    ... ISSN 1082-9873. Available from DOI : 10.1045/july2005-lynch
  * **[false]** ... ISSN 1082-9873. Available from DOI : 10.1045/july2005-lynch.

### Bibliographic fields

Some fields have a different meaning than in plain BibTeX, as compared to
`biblatex`.

1\. If the publication is written in a different language to the main
document, it should have a filled `langid` field.

```
langid = {czech},
```

2\. Publications with online versions should have a `urldate` field. It is the
date when you last checked the publication online.

```
urldate = {2011-01-12},
```

3\. If the publication has more than one ISBN or ISSN number, preferably use
just one of them. Otherwise you can separate multiple numbers with comma in
the respective field.

4\. Publisher and place:

```
location = {Praha},
publisher = {Academia},
```

Some fields are added on top of the fields supported by `biblatex` and are
valid only for this package.

5\. Supervisor of thesis / dissertation:

```
supervisor = {Petr Sojka},
```

6\. Date specificities, anything that doesn't fit into the `date` field:

```
dateaddon = {\mkbibbrackets{16th century}},
```

For more details see the example bibliography file [biblatex-iso690-examples.bib](./biblatex-iso690-examples.bib).

## Contributing

### Translations

This package comes with the extension of the localization files (`.lbx`) to
their standard versions shipped with `biblatex`. The naming convention for
these files is `<langid>-iso.lbx`, where `langid` is the name of the language
known by Babel.

If the `<langid>.lbx` is already included in `biblatex`, adding a
`<langid>-iso.lbx` is as easy as adding this single file to the root directory
of this package. Otherwise, please consider [a contribution to the `biblatex`
package](https://github.com/plk/biblatex/#translation) first.

If you also aim to add new localization strings, you have to define them via
`\NewBibliographyString` command at the beginning of the [iso.bbx](iso.bbx)
file.

A quick translation guideline for the additional strings is available at the
wiki page [Translation
Guideline](https://github.com/michal-h21/biblatex-iso690/wiki/Translation-Guideline).

You might want to see also some already existing translations, e.g.
[english-iso.lbx](english-iso.lbx) or [slovak-iso.lbx](slovak-iso.lbx).

## License

Copyright (C) 2011--2020 Michal Hoftich
              2015--2020 Moritz Wemheuer
              2016--2020 Dávid Lupták

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status `maintained`.

The Current Maintainer of this work is Michal Hoftich.

This work consists of all files listed in [manifest.txt](./manifest.txt).

The package is available on CTAN https://www.ctan.org/pkg/biblatex-iso690
and is included in MikTeX and TeX Live 2016 or later as `biblatex-iso690`.
The development version can be found on GitHub
https://github.com/michal-h21/biblatex-iso690.
