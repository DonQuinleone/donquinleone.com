# donquinleone.com

Static landing page for DonQuinleone, styled as a replayed
terminal session in the Kanagawa Wave palette. No JavaScript, no
cookies, no tracking; the fonts are self-hosted and the page
makes no external requests.

Everything that ships lives in `site/`:

    site/
    ├── index.html         the page
    ├── 404.html           not-found page, same style
    ├── css/style.css      palette, boot timeline, layout
    ├── fonts/             JetBrains Mono 400 and 700 (woff2)
    │                      and its OFL licence text
    ├── favicon.svg        prompt-and-cursor mark (source)
    ├── favicon.ico        raster fallback, from the SVG
    ├── apple-touch-icon.png
    ├── donquinleone.asc   armoured public PGP key
    └── robots.txt         blocks all crawlers and archivers

## Working on it

You need `git`, `python3` and `make`.

    git clone https://github.com/DonQuinleone/donquinleone.com.git
    cd donquinleone.com
    make serve

Then open http://localhost:8000 in a browser. `make build` runs
a well-formedness check over the HTML; `make package` produces
`dist/site.tar.gz`; `make clean` removes `dist/`.

## Publishing

Every push to `master` runs `.github/workflows/pages.yml`, which
checks the HTML and deploys `site/` to GitHub Pages at
https://donquinleone.com. Pull requests run the check without
deploying.

## Licence

MIT; see [LICENSE](LICENSE). The vendored JetBrains Mono fonts
carry their own licence (SIL OFL 1.1).
