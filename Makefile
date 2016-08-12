.PHONY: default-rule
default-rule: .merlin .ocamlinit site

include $(shell opam config var solvuu-build:lib)/solvuu.mk

PRODUCTION=false

# Paths to local executables.
babel=node_modules/.bin/babel
browserify=node_modules/.bin/browserify
node-sass=node_modules/.bin/node-sass
postcss=node_modules/.bin/postcss
cufp.org=./cufp.org

################################################################################
# CSS
site/css/app.css: $(wildcard site/css/*.scss) \
                  _cache/foundation-icons \
                  node_modules/autoprefixer \
                  node_modules/foundation-sites \
                  node_modules/motion-ui \
                  node_modules/node-sass \
                  node_modules/postcss-cli \
                  etc/autoprefixer-config.json
	$(node-sass) --include-path node_modules/foundation-sites/scss \
                     --include-path node_modules/motion-ui/dist \
                     site/css/app.scss > $@ || rm -f $@
	$(postcss) --use autoprefixer \
                   --local-plugins \
                   -c etc/autoprefixer-config.json \
                   -d site/css $@

# See changes we've made to Foundation settings.
.PHONY: diff-foundation-settings
diff-foundation-settings: node_modules/foundation-sites
	diff \
          node_modules/foundation-sites/scss/settings/_settings.scss \
          site/css/_settings.scss


################################################################################
# JavaScript
site/js/app.min.js: site/js/app.js \
                    site/js/_functions.js \
                    node_modules/babel-cli \
                    node_modules/foundation-sites
	$(babel) -o $@ --minified \
            node_modules/foundation-sites/dist/plugins/foundation.core.js \
            node_modules/foundation-sites/dist/plugins/foundation.util.mediaQuery.js \
            site/js/_functions.js \
            site/js/app.js


################################################################################
# OCaml
_build/app/cufp.org.byte: FORCE
	$(OCAMLBUILD) app/cufp.org.byte

_build/app/cufp.org.native: FORCE
	$(OCAMLBUILD) app/cufp.org.native

_build/app/cufp.org: _build/app/cufp.org.byte
	cp -f $< $@

$(cufp.org): _build/app/cufp.org.byte
	cp -f $< $@


################################################################################
# 3rd Party Packages
_cache/foundation-icons: | _cache
	wget -O _cache/foundation-icons.zip http://zurb.com/playground/uploads/upload/upload/288/foundation-icons.zip
	unzip -q -o -d _cache _cache/foundation-icons.zip
	rm -rf _cache/__MACOSX

node_modules/autoprefixer:
	npm install autoprefixer

node_modules/babel-cli:
	npm install babel-cli

node_module/browserify:
	npm install browserify

node_modules/foundation-sites:
	npm install foundation-sites@6.2.3

node_modules/motion-ui:
	npm install motion-ui@1.2.2

node_modules/node-sass:
	npm install node-sass

node_modules/postcss-cli:
	npm install postcss-cli


################################################################################
# Build Site

# General markdown files.
markdown-bases=site/about.md site/bylaws.md site/license.md \
               site/steering-committee.md \
               site/2016/call-for-presentations.md \
               site/2016/call-for-tutorials.md
$(patsubst %.md, _build/%.html, $(markdown-bases)): _build/site/%.html: site/%.md | _build/tmp
	$(cufp.org) build markdown -production $(PRODUCTION) $<

# General html files.
html-files=site/blog/index.html site/videos/index.html site/2016/index.html
$(patsubst %, _build/%, $(html-files)): _build/site/%.html: site/%.html | _build/tmp
	$(cufp.org) build html -production $(PRODUCTION) $<

# Blog main page.
_build/site/blog/index.html: site/blog/* | _build/tmp
	$(cufp.org) build html -production $(PRODUCTION) site/blog/index.html

# Blog RSS feed.
_build/site/blog/all.rss.xml: $(wildcard site/blog/20*)
	$(cufp.org) build blog-rss >| $@

# Blog post markdown files.
blog-post-bases=$(wildcard site/blog/20*.md)
$(patsubst %.md, _build/%.html, $(blog-post-bases)): _build/site/%.html: site/%.md | _build/tmp
	$(cufp.org) build blog-post -production $(PRODUCTION) $<

# robots.txt
_build/site/robots.txt:
	$(cufp.org) build robots -production $(PRODUCTION) >| $@

years_2009-2015=2009 2010 2011 2012 2013 2014 2015
$(patsubst %, _build/site/%, $(years_2009-2015)): _build/site/%: site/%
	rsync -a $</*.html $@/

.PHONY: site
site: $(cufp.org) \
      _build/app/cufp.org \
      site/css/app.css \
      site/js/app.min.js \
      _cache/foundation-icons \
      $(patsubst %.md, _build/%.html, $(markdown-bases)) \
      $(patsubst %, _build/%, $(html-files)) \
      _build/site/blog/index.html \
      _build/site/blog/all.rss.xml \
      $(patsubst %.md, _build/%.html, $(blog-post-bases)) \
      _build/site/robots.txt \
      $(patsubst %, _build/site/%, $(years_2009-2015)) \
      | _build/site/css _build/site/js _build/tmp

	cp -f site/css/app.css _build/site/css/
	cp -f site/js/app.min.js _build/site/js
	rsync -a --exclude=foundation-icons.css --exclude=preview.html _cache/foundation-icons/ _build/site/css/

	cp -f site/index.html _build/site/
	rsync -a --exclude=/icon/ ../cufp.org-media/* _build/site/
	cp -f ../cufp.org-media/icon/favicon-32x32.png _build/site/
	rsync -a site/200[4-8] site/conference _build/site/
	rsync -a site/201[4-6]cfp _build/site/
	rsync -a --exclude=/index.html site/videos/ _build/site/videos/

	$(cufp.org) build events -background img/photo-1461727885569-b2ddec0c4328.jpeg -production $(PRODUCTION) 2016


################################################################################
# Empty directories, used as order-only prerequisites
_cache:
	mkdir $@

_build:
	mkdir $@

_build/site: | _build
	mkdir $@

_build/site/js: | _build/site
	mkdir $@

_build/site/css: | _build/site
	mkdir $@

_build/tmp: | _build
	mkdir $@


################################################################################
# Clean Up
clean-site:
	rm -rf _build/site

clean:
	ocamlbuild -clean
	rm -f $(cufp.org)
	rm -rf site/css/.sass-cache

clean-cache:
	rm -rf _cache
	rm -rf node_modules

distclean: clean clean-cache

clean-everything: distclean
	rm -f site/css/cufp.css
	rm -f site/js/app.min.js

# Don't delete this. It is a trick to make ocamlbuild always run. See above.
FORCE:
