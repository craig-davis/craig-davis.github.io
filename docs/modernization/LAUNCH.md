# Phase 9 Launch Review

## Release state

Phase 9 is a release candidate. Local and current-production checks pass, but the phase remains active until the Phase 9 merge has deployed and the post-deploy smoke test succeeds.

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

## Open before completion

1. Merge and deploy the Phase 9 release candidate.
2. Repeat production route, feed, sitemap, robots, redirect, calculator, and 404 smoke tests.
3. Decide whether to add `www.there4.io`; it currently has no DNS record. If added, redirect it permanently to `https://there4.io/`.
4. Configure HSTS and common defensive response headers in DigitalOcean or the CDN, where production headers are controlled.

## Intentional deferrals

- Calculator redesign and possible subdomain migration
- Retirement of unloaded legacy static assets and their protected public URLs
- Visitor analytics; none is shipped without a concrete measurement and privacy decision
