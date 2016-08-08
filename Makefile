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
.PHONY: site
site: $(cufp.org) \
      _build/app/cufp.org \
      site/css/app.css \
      site/js/app.min.js \
      _cache/foundation-icons \
      | _build/site/css _build/site/js _build/tmp
	cp -f site/css/app.css _build/site/css/
	cp -f site/js/app.min.js _build/site/js
	rsync -a _cache/foundation-icons/ _build/site/css/
	rm -f _build/site/css/foundation-icons.css
	rsync -a ../cufp.org-media/* _build/site/
	$(cufp.org) make -repo-root . -production $(PRODUCTION) "/"


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
