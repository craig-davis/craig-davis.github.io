# Phase 9 Launch Review

## Release state

Phase 9 is complete. Merge commit `64d1cf7` deployed successfully, and the post-deploy smoke test passed against the canonical production domain.

## Verified locally

- `bin/verify` builds and checks all 76 published articles, 705 protected baseline URLs, both calculator checksums, search, reading state, topic batches, feed, sitemap, and robots
- All 114 generated HTML routes have a clean quality report
- RSS contains ten recent entries with non-empty titles, descriptions, links, GUIDs, and publication dates
- Sitemap contains 108 unique canonical HTTPS locations, including primary pages, four topics, and all 15 tag archives
- Redirect pages, the 404 route, and protected calculators are intentionally excluded from the sitemap
- Feed and sitemap parse as XML

## Responsive and interactive review

Representative homepage, archive, article, and search routes were checked at desktop (1440×1000), tablet (820×1100), and phone (390×844) sizes.

- No horizontal overflow or broken rendered images
- One H1 and a main landmark on every modern route
- Navigation, cards, archive grids, article mastheads, and prose reflow at each size
- Browser-local search returns the expected article and preserves `?q=` state
- Curated article navigation exposes `aria-current="location"` and reduced-motion behavior
- No browser console errors or warnings during representative interaction

## Current production smoke test

Checked against `https://there4.io` on August 29, 2026:

- Apex HTTPS homepage, posts, topics, representative article, feed, sitemap, robots, calculators, and compatibility paths respond successfully
- Plain HTTP redirects to apex HTTPS
- Unknown paths return HTTP 404
- Phase 8 structured data is present in production
- CSS is gzip-compressed and CDN-cached

## Post-deploy verification

- Representative primary, archive, topic, tag, article, redirect, calculator, and machine-readable routes return HTTP 200
- An unknown route returns HTTP 404
- Plain HTTP returns 301 to `https://there4.io/`
- RSS contains ten items, the sitemap contains 108 locations, and robots advertises the sitemap
- `/flat-trim/` matches SHA-256 `f9959988cd057900598cbd7dd502bd67bd6e48dbf0e4d40bcbfee11528c23a50`
- `/running-calculator/` matches SHA-256 `edc1ba7e03658536e8cb5a06c3d22b68e0c4c7cc058bfc0ec5fe6b21e3379178`

## Infrastructure follow-ups

1. Decide whether to add `www.there4.io`; it currently has no DNS record. If added, redirect it permanently to `https://there4.io/`.
2. Configure HSTS and common defensive response headers in DigitalOcean or the CDN, where production headers are controlled.

## Intentional deferrals

- Calculator redesign and possible subdomain migration
- Retirement of unloaded legacy static assets and their protected public URLs
- Visitor analytics; none is shipped without a concrete measurement and privacy decision
