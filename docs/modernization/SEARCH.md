# Static Search and Reading State

## Search architecture

Jekyll generates `/search-index.json` from published posts. The index contains only title, description, URL, publication date, topic, and tags. `/search/` fetches that same-origin file and performs a small, dependency-free search in the browser.

Results require every query term and rank title matches above topic, tag, and description matches. A maximum of 50 results keeps rendering bounded. Search terms may be shared with the `?q=` URL parameter, but no query leaves the browser and no analytics event is sent.

Without JavaScript, the page links to the complete chronological, topic, and tag archive. Search is an enhancement rather than a discovery dependency.

## Article table of contents

Articles with curated `toc` front matter load `js/article-toc.js`. The script marks the current link with `aria-current="location"`, updates a visually hidden current-section description, and makes no content or navigation unavailable when JavaScript is absent.

The behavior uses the existing browser scroll position and `requestAnimationFrame`. It performs no animated scrolling and therefore respects the site's reduced-motion behavior.

## Verification

`scripts/verify_search.rb` checks index structure, uniqueness, local destinations, search-page accessibility hooks, deferred loading, and the no-JavaScript archive path. The generated-site audit also protects titles, descriptions, headings, canonical URLs, JSON-LD, links, images, and oversized assets against new regressions.
