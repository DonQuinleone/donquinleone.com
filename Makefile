# Static site: nothing to compile, so "build" just proves the
# HTML is well formed before it is packaged or published.

SITE_DIR := site
DIST_DIR := dist
TARBALL := $(DIST_DIR)/site.tar.gz
PREVIEW_PORT := 8000

.PHONY: build serve package clean

build:
	python3 -c "import html.parser, pathlib, sys; \
	[html.parser.HTMLParser().feed( \
	    p.read_text(encoding='utf-8')) \
	 for p in pathlib.Path('$(SITE_DIR)').glob('*.html')]; \
	print('html ok')"

serve:
	python3 -m http.server $(PREVIEW_PORT) -d $(SITE_DIR)

package: build
	mkdir -p $(DIST_DIR)
	tar -C $(SITE_DIR) -czf $(TARBALL) .

clean:
	rm -rf $(DIST_DIR)
