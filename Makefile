.PHONY: default
default: site

include $(shell opam config var solvuu-build:lib)/solvuu.mk

PRODUCTION=false

# Path to node-sass executable.
node-sass=node_modules/node-sass/bin/node-sass

################################################################################
# CSS
site/css/cufp.css: $(wildcard site/css/*.scss) $(node-sass) node_modules/foundation-sites
	$(node-sass) --include-path node_modules/foundation-sites/scss site/css/cufp.scss > $@ || rm -f $@

# See changes we've made to Foundation settings.
.PHONY: diff-scss
diff-scss:
	diff $(shell opam config var foundation:lib)/scss/foundation/_settings.scss site/css/_settings.scss


################################################################################
# Command Line App
APP=./cufp.org
_build/app/cufp.org.byte:
	ocamlbuild app/cufp.org.byte

_build/app/cufp.org.native:
	ocamlbuild app/cufp.org.native

$(APP): _build/app/cufp.org.byte
	cp -f $< $@

_build/app/cufp.org: _build/app/cufp.org.byte
	cp -f $< $@


################################################################################
# 3rd Party Packages
_cache/foundation-icons.zip: | _cache
	wget -O $@ http://zurb.com/playground/uploads/upload/upload/288/foundation-icons.zip

_cache/foundation-icons: _cache/foundation-icons.zip
	unzip -q -o -d _cache $<
	rm -rf _cache/__MACOSX

$(node-sass):
	npm install node-sass@3.8.0

node_modules/foundation-sites:
	npm install foundation-sites@6.2.3

_cache/fairhead-webicons-v2.0.tar.gz: | _cache
	wget -O $@ https://github.com/adamfairhead/webicons/archive/v2.0.tar.gz

_cache/fairhead-webicons: _cache/fairhead-webicons-v2.0.tar.gz
	cd _cache && tar xzf fairhead-webicons-v2.0.tar.gz
	mv _cache/webicons-2.0 $@

_cache/flaticon-feather-pen-0.1.tar.gz: | _cache
	wget -O $@ https://github.com/agarwal/flaticon-feather-pen/archive/0.1.tar.gz

_cache/flaticon-feather-pen: _cache/flaticon-feather-pen-0.1.tar.gz
	cd _cache && tar xzf flaticon-feather-pen-0.1.tar.gz
	mv _cache/flaticon-feather-pen-0.1 $@

################################################################################
# Build Site
.PHONY: site
site: $(APP) _build/app/cufp.org site/css/cufp.css node_modules/foundation-sites _cache/foundation-icons _cache/fairhead-webicons _cache/flaticon-feather-pen | _build/site/js _build/tmp
	cp -f node_modules/foundation-sites/vendor/jquery/dist/jquery.min.js _build/site/js/
	cp -f node_modules/foundation-sites/dist/foundation.min.js _build/site/js/
	rsync -a _cache/foundation-icons _build/site/css/
	rsync -a _cache/fairhead-webicons _build/site/css/
	rsync -a _cache/flaticon-feather-pen _build/site/css/
	rsync -a ../cufp.org-media/* _build/site/
	$(APP) make -repo-root . -production $(PRODUCTION) "/"


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
	rm -f $(APP)
	rm -rf site/css/.sass-cache

clean-cache:
	rm -rf _cache
	rm -rf node_modules

distclean: clean clean-cache

clean-everything: clean clean-cache
	rm -f site/css/cufp.css

