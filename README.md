[CUFP.ORG](http://cufp.org)
===========================
Implementation of the cufp.org website.


DEPENDENCIES
============
Most contributors will only be adding content, and don't necessarily
need to build the site locally. You can just add or modify Markdown
files.

If you do want to test your changes locally before pushing, you'll
need to have several OCaml, for which we assume you have
[opam](http://opam.ocaml.org/). Once you have it installed, you can
do:

```
opam switch cufp.org -A 4.02.3
cd /to/your/working/directory
opam pin add cufporg . -n
opam pin add solvuu_build 0.0.2
opam install cufporg --deps-only
```

The `switch` step is optional. It is recommended unless this is the
only OCaml project you work on.

You will also need to have some JavaScript libraries installed, for
which we assume you have [npm](https://www.npmjs.com/)
installed. However, you do not need to explicitly run it. JavaScript
packages will be installed as needed by the build process, described
in the next section.


BUILD INSTRUCTIONS
==================
The site consists only of static pages, so can be built and run
entirely on a local machine without dependencies on external file or
database servers.

Running `make` will build a development version of the site at
`_build/site`, and also the underlying OCaml library and command line
app that are used to build the site.

Run `make PRODUCTION=true` to build a version ready for publication
to cufp.org. The production version includes analytics tracking code,
has a different robots.txt file, and relativizes links differently.

Run `make clean` to remove most generated files, `make clean-site`
to remove the generated site, and `make clean-doc` to remove
generated documentation.


PUBLISH INSTRUCTIONS
====================
Run `bin/publish.sh` to compile a production version of the site and
publish it. Of course, this will only work if you have access to the
server.


DIRECTORY STRUCTURE
===================
`site/` — Main content of the site. Most files are in Markdown
syntax and converted to HTML by the build scripts. If you are only
contributing content, this will likely be the only directory you need
to look at. Sub-files are described in greater detail below.

`template/` — Templates governing the overall look and feel of the
site. These are applied to the pages within `site/` when the site
is built.

`lib/` — OCaml library that does most of the work of generating
the site.

`app/` — Implementation of an app to build and publish the
site. It is a command line interface to the library above. Run the app
without arguments for more information. When built, it is symlink'ed
as `cufp.org` in the repo's root.

`bin/` — Scripts.

`site/css/cufp.css` — The main CSS file, generated from cufp.scss
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

Most files within `site/` and `template/` are first processed
through MPP, as described in more detail below. Thus, strictly they
are MPP files, not Markdown or HTML files as their .md and .html file
extensions suggest. Of course, the reason for keeping the .md and
.html extensions is that the majority of the content really is
Markdown or HTML; most files have little or no MPP sections.


PROCESSING PIPELINE
===================
Source files within `site/` are processed through a sequence of
steps to produce the HTML pages constituting the site. The OCaml
[`Asset`](https://github.com/CUFP/cufp.org/blob/master/lib/cufp_asset.mli)
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
`cufp.org` app will be needed to generate schedule tables.

###### event page
An event file must be named in the format:
`YYYY-MM-DD_HHMM_HHMM_short-title.md`, which indicates the event's
date, start time, end time, and short title used as the URL. The file
contents must be Markdown starting with an unordered list. Each list
item is a colon separated tag-value pair as follows:

- type: (talk | keynote | tutorial | bof | break | discussion |
  reception). Required.

- title: free text. Required.

- speakers: comma separated list of speaker names. Optional.

- affiliations: comma separated list of speaker's affiliations. List
  must have same number of items as speakers. Leave empty items if
  only some speakers' affiliation is to be listed. The affiliation
  cannot itself have a comma. Optional.

- session: Name of session which this event is part of. Optional.

- video: Link to YouTube or Vimeo video. Optional.

- slides: Site root-relative path to slides. Slides must not be added
  to the `cufp.org` repo. They go in
  [cufp.org-media](https://github.com/CUFP/cufp.org-media).

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


LICENSES
========
See
[license.md](https://github.com/CUFP/cufp.org/blob/master/site/license.md)
within this repo or the [published
version](http://cufp.org/license.html).
