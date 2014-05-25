[CUFP.ORG](http://cufp.org)
===========================
Implementation of the cufp.org website.


DEPENDENCIES
============
The site is implemented in OCaml, so you will need OCaml and several
OCaml libraries to build the site yourself.


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

Run `omake clean` to remove most generated files, `omake distclean` to
remove all generated files, `omake siteclean` to remove the generated
site, and `omake docclean` to remove generated documentation.


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
without arguments for more information.

`ext/` — Files from external sources, e.g. CSS or Javascript
libraries. These are copied without modification to the generated
site.

`bower/` — Packages installed by the Bower package manager. It eases
installation of Foundation and its dependencies. Doing `omake bower`
will generate this directory, but we check it into the repo to avoid
the dependency on bower most of the time. Doing `omake distclean` will
remove it.

`src/site/css/cufp.css` — The main CSS file, generated from cufp.scss
in the same directory. It is checked into the repo to avoid the
dependency on SASS most of the time.


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
steps to produce the HTML pages constituting the site. The following
describes how each kind of file is processed.

### .md files
1. Run through MPP.
2. Convert result of previous step to HTML using
   [OMD](https://github.com/pw374/omd)'s `to_html` function.
3. The result is now pure HTML. However, it is not a full HTML page;
   it constitutes only the main content of a page and lacks a header,
   footer, etc.
4. Run MPP on `src/template/main.html` with the MPP `content` variable
   set to the HTML generated in the previous step. Note the template
   contains other MPP commands also.

Links can be given in either relative or site-root relative form. You
can use the MPP `production` variable, which will be set to either
true or false.

### .html files
Same as .md files above, except the "convert to html" step is not
needed.

### .txt files
1. Run through MPP.

No further processing is done; .txt files remain as .txt files. You
can use the MPP `production` variable, as in .md and .html files.

### .js, .css, .jpeg, etc.
Copied unaltered.

## conference files
TODO: Describe format of conference files.

## blog posts
TODO: Describe format of blog files.

## css/, img/, archive/ directories
Copied unaltered.


CONTACTS
========
Report bugs or suggest content changes by creating an issue on
[GitHub](https://github.com/cufp/cufp.org). Or better, fork the repo,
make changes to your copy, and submit a pull request.
