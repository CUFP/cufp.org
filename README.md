[CUFP.ORG](http://cufp.org)
===========================
Implementation of the cufp.org website.


DEPENDENCIES
============
The site is implemented in OCaml, so to build the site yourself you
will need OCaml and several OCaml libraries:
[OMD](https://github.com/ocaml/omd),
[MPP](https://github.com/pw374/MPP-language-blender),
[Core](https://github.com/janestreet/core),
[Async](https://github.com/janestreet/async),
[Uri](https://github.com/mirage/ocaml-uri/),
[Yojson](http://mjambon.com/yojson.html), and
[ocamlnet](http://projects.camlcity.org/projects/ocamlnet.html). Styling
makes use of [Zurb Foundation](http://foundation.zurb.com/). However, most
contributors will only be adding content, and don't necessarily need
to build the site locally. You can just add or modify Markdown files.


BUILD INSTRUCTIONS
==================
The site consists only of static pages, so can be built and run
entirely on a local machine without dependencies on external file or
database servers.

Running `omake` will build a development version of the site at
`_build/site`, and also the underlying OCaml library and command line
app that are used to build the site.

Run `omake PRODUCTION=true` to build a version ready for publication
to cufp.org. The production version includes analytics tracking code,
has a different robots.txt file, and relativizes links differently.

Run `omake doc` to generate documentation for the OCaml library that
does most of the work to generate the site. Open
`_build/doc/api/index.html` to browse the API.

Run `omake clean` to remove most generated files, `omake clean-site`
to remove the generated site, and `omake clean-doc` to remove
generated documentation.


PUBLISH INSTRUCTIONS
====================
Run `bin/publish.sh` to compile a production version of the site and
publish it. Of course, this will only work if you have access to the
server.


DIRECTORY STRUCTURE
===================
`src/site/` — Main content of the site. Most files are in Markdown
syntax and converted to HTML by the build scripts. If you are only
contributing content, this will likely be the only directory you need
to look at. Sub-files are described in greater detail below.

`src/template/` — Templates governing the overall look and feel of the
site. These are applied to the pages within `src/site/` when the site
is built.

`src/lib/` — OCaml library that does most of the work of generating
the site.

`src/app/` — Implementation of an app to build and publish the
site. It is a command line interface to the library above. Run the app
without arguments for more information. When built, it is symlink'ed
as `cufp.org` in the repo's root.

`src/bin/` — Scripts.

`ext/` — Files from external sources, e.g. CSS or Javascript
libraries. These are copied without modification to the generated
site.

`bower/` — Packages installed by the Bower package manager. It eases
installation of Foundation and its dependencies. Doing `omake bower`
will generate this directory, but we check it into the repo to avoid
the dependency on bower most of the time.

`src/site/css/cufp.css` — The main CSS file, generated from cufp.scss
in the same directory. It is checked into the repo to avoid the
dependency on SASS unless you are modifying the site's design.


ABOUT MPP
=========
MPP is used as a templating tool and to auto-generate various other
content. It is a preprocessor that allows programmatically inserting
content into virtually any other kind of text file. One inserts MPP
sections delimited in a customizalbe way, e.g. enclosed in double
parentheses (( )) or double curly braces {{ }}, and within such a
section you can for example write an arbitrary bash command. MPP will
run the command and replace the MPP section with whatever the command
prints to stdout. Thus, running MPP on a file removes all MPP
sections.

See the [MPP repo](https://github.com/pw374/MPP-language-blender) and
[Philippe Wang](http://pw374.github.io/)'s website for details.

Most files within `src/site` and `src/template` are first processed
through MPP, as described in more detail below. Thus, strictly they
are MPP files, not Markdown or HTML files as their .md and .html file
extensions suggest. Of course, the reason for keeping the .md and
.html extensions is that the majority of the content really is
Markdown or HTML; most files have little or no MPP sections.


PROCESSING PIPELINE
===================
Source files within `src/site` are processed through a sequence of
steps to produce the HTML pages constituting the site. The OCaml
[`Asset`](https://github.com/CUFP/cufp.org/blob/master/src/lib/cufp_asset.mli)
module implements the logic of generating the site. Each file type is
categorized as being of a certain type, e.g. a general Markdown file,
or more specifically a Markdown file that contains a blog post. The
`make` function in this module defines how each type of asset is
compiled. A rough description is below:

###### conference main page
Each conference is organized under a directory named YYYY, the 4-digit
year of the conference. The index.md files are mostly markdown but
also contain HTML formatting elements because there is a fair bit of
custom styling done for each page. The styling requires knowledge of
Zurb Foundation. The best way to start a new conference is to copy a
page from a previous year and mimic the sections. MPP calls to the
`cufp.org` app will be needed to generate session tables.

###### session page
A session file must be named in the format:
`YYYY-MM-DD_HHMM_HHMM_short-title.md`, which indicates the session's
date, start time, end time, and short title used as the URL. The file
contents must be Markdown starting with an unordered list. Each list
item is a colon separated tag-value pair as follows:

- type: (talk | keynote | tutorial | bof | break). Required.

- title: free text. Required.

- speakers: comma separated list of speaker names. Optional.

- affiliations: comma separated list of speaker's affiliations. List
  must have same number of items as speakers. Leave empty items if
  only some speakers' affiliation is to be listed. The affiliation
  cannot itself have a comma. Optional.

- video: Link to YouTube or Vimeo video. Optional.

- slides: Site root-relative path to slides. Slides must not be added
  to the `cufp.org` repo. They go in `cufp.org-media`.

Everything after this unordered list is displayed as the session's
page.

###### blog posts
Each blog post is written in a file named in the format:
`YYYY-MM-DD_short-title.md`, which indicates the posting date of the
blog and the short title used as the URL. The file contents must be a
Markdown file starting with an unordered list. Each list item is a
colon separated tag-value pair as follows:

- title: free text. Required.
- categories: comma separated list of categories. Optional.
- author: author name. Optional.

Everything after this list is taken as the blog post's content.

###### .md files
Other Markdown files, not handled specifically above, are converted to
HTML using OMD and processed through MPP.

###### .html files
Processed through MPP.

###### .txt files
Processed through MPP.

###### .js, .css, .jpeg, etc.
Copied unaltered.

###### css/, img/, archive/ directories
Copied unaltered.


CONTACTS
========
Report bugs or suggest content changes by creating an issue on
[GitHub](https://github.com/cufp/cufp.org). Or better, fork the repo,
make changes to your copy, and submit a pull request.
