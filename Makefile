.PHONY: default
default: site

include $(shell opam config var solvuu_build:lib)/solvuu.mk

PRODUCTION=false

################################################################################
# CSS
site/css/cufp.css: $(wildcard site/css/*.scss)
	sass -q -I $(shell opam config var lib) cufp.scss > $@

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
# Build Site
.PHONY: site
site: $(APP) _build/app/cufp.org site/css/cufp.css
	mkdir -p _build/site
	mkdir -p _build/tmp
	rsync -a $(shell opam config var modernizr:lib)/modernizr.js _build/site/js/
	rsync -a $(shell opam config var jquery:lib)/jquery.* _build/site/js/
	rsync -a $(shell opam config var fastclick:lib)/fastclick.js _build/site/js/
	rsync -a $(shell opam config var foundation:lib)/js/foundation/foundation*.js _build/site/js/
	rsync -a $(shell opam config var foundation-icons:lib) _build/site/css/
	rsync -a $(shell opam config var fairhead-webicons:lib) _build/site/css/
	rsync -a $(shell opam config var flaticon-feather-pen:lib) _build/site/css/
	rsync -a ../cufp.org-media/* _build/site/
	$(APP) make -repo-root . -production $(PRODUCTION) "/"


################################################################################
# Clean Up
clean-site:
	rm -rf _build/site

clean:
	ocamlbuild -clean
	rm -f $(APP)
	rm -rf site/css/.sass-cache

# Should rarely need to run this. Regenerating these files requires a
# lot of additional software.
clean-everything: clean
	rm -f site/css/cufp.css
