# There4 Modernization Audit

## Baseline

- Repository: `craig-davis/craig-davis.github.io`
- Production host: DigitalOcean App Platform static site
- Production build command: `bundle exec jekyll build -d ./public`
- Current branch: `master`
- Archive: 77 posts spanning 2011–2025
- Standalone tools: `/flat-trim/` and `/running-calculator/`

## Platform

- Jekyll 3.6.3 with a Ruby 2.7.8 lockfile declaration.
- Plugins: `jekyll-paginate`, `jekyll-redirect-from`, and `jekyll-gist`.
- `minima` is installed but custom layouts control the visible site.
- `permalink: pretty` produces date-based post paths.
- The current build succeeds but emits extensive Ruby compatibility warnings and a deprecated `gems` configuration warning.

## Frontend

- Customized Start Bootstrap Clean Blog theme.
- Bootstrap 3.3.4, jQuery 2.1.3, LESS, Grunt, Font Awesome 4.3, and external Google Fonts.
- Obsolete Internet Explorer compatibility scripts remain in the head.
- JavaScript currently supplies responsive image classes and wraps tables and embedded video.

## Content and metadata

- Historical layouts include post, photo, instructable, books, podcast, and remote variants.
- Most posts have subtitles and header images, but few have explicit descriptions.
- No posts currently use standardized modified dates, featured flags, or related-post metadata.
- Existing taxonomy is tag-only; no broad topic field exists.
- Known front-matter anomalies include `sustitle`, `permalinkXDC`, an isolated `science` field, empty tags, and a `podcast` tag missing from `_data/tags.yml`.

## SEO and semantics

- Existing: HTML titles, description fallbacks, canonical URLs, sitemap, RSS feed, robots.txt, and static crawlable output.
- Missing: OpenGraph, social-card metadata, and Article/BlogPosting JSON-LD.
- The audited generated site had no `main` landmarks, several pages without H1 elements, and two pages with multiple H1 elements.
- Image markup has widespread missing alternative text and lacks explicit dimensions.

## Images

- Approximately 588 image files totaling about 215 MB at the initial audit.
- Images are primarily local JPEGs under `img/headers/` and `img/posts/`.
- No responsive derivative or modern-format pipeline exists.
- Several source images exceed 1 MB.
- No recoverable standalone There4 wordmark asset was found.

## Affiliate and legacy integrations

- Hundreds of Amazon/Amazon-short links are distributed across dozens of posts.
- The books layout is Amazon-specific; the disclosure include is generic but dated.
- Universal Analytics `analytics.js`, external fonts, MaxCDN Font Awesome, jQuery, Bootstrap, and old IE shims remain active.
- No active Disqus integration was found.

## Link and asset findings

Items requiring confirmation include a missing `fsm-wiring-repair.jpg`, a YouTube URL without a scheme, and unresolved reference-style destinations named `por15`, `deburring-tool`, and `aob-switch`.

## Strategy

The final state is a complete modernization of all posts and pages. Compatibility behavior is temporary scaffolding, not the intended endpoint. URLs, publication dates, and historical content remain stable while layouts, metadata, taxonomy, callouts, related items, images, accessibility, and presentation are reviewed across the entire archive.
