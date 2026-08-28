# There4 Modernization Roadmap

This directory is the authoritative project record for the There4 redesign. It is excluded from the generated Jekyll site.

## Project principles

- Keep There4 a personal blog and archive.
- Preserve every existing public URL unless a verified defect requires a redirect.
- Modernize all posts, specialized content layouts, and supporting pages.
- Keep the site static, semantic, accessible, fast, and maintainable.
- Treat original photography as editorial evidence, not decoration.
- Use affiliate recommendations selectively and only when grounded in firsthand experience.
- Keep the site buildable and deployable after every implementation phase.

## Status key

- `Not started` — scoped but no implementation work has begun.
- `Active` — currently being implemented.
- `Blocked` — cannot proceed until a recorded dependency or decision is resolved.
- `Complete` — exit criteria have passed and evidence is recorded.

## Phases

### 0. Safety baseline

**Status:** Complete

Scope:

- Document the DigitalOcean deployment contract.
- Capture all generated URLs, including calculators and redirects.
- Add repeatable build, URL-parity, link, and basic HTML checks.
- Establish the archive migration inventory.

Exit criteria:

- The production build command succeeds locally.
- Existing public URLs are captured in a versioned manifest.
- URL parity can be checked automatically.
- The modernization documents are absent from generated output.

Completion evidence:

- `bin/verify` runs the production-equivalent build and regression checks.
- `test/baseline/public-urls.txt` protects 705 generated file URLs.
- `test/baseline/quality-report.json` records existing generated HTML debt and prevents new regressions.
- The verification passes with both calculator URLs present and no project-only `bin/`, `docs/`, `scripts/`, or `test/` output.

### 1. Jekyll and Ruby modernization

**Status:** Complete

Scope:

- Pin a supported Ruby version.
- Upgrade Jekyll and required plugins conservatively.
- Replace deprecated configuration.
- Remove dependencies confirmed to be unused.
- Preserve the existing appearance during the toolchain change.

Exit criteria:

- A clean checkout builds reproducibly using the documented command.
- Generated URL parity passes.
- Ruby/Jekyll compatibility warnings are eliminated or explicitly documented.

Completion evidence:

- Ruby 3.4.7, Bundler 2.7.2, and Jekyll 4.4.1 are pinned and build successfully.
- The DigitalOcean-equivalent `bin/verify` gate preserves all 705 baseline public files.
- Both calculator URLs and all generated HTML quality baselines pass unchanged.
- GitHub Actions verifies the build on Ubuntu 22.04 using the repository-pinned runtime.
- A direct Jekyll 3 versus Jekyll 4 output comparison found only documented renderer and feed-generator differences.

### 2. Design system and semantic shell

**Status:** Not started

Scope:

- Implement design tokens, typography, navigation, footer, and responsive shell.
- Integrate the authentic There4 wordmark when available.
- Replace Bootstrap, LESS, Grunt, jQuery, Font Awesome, and obsolete browser shims.
- Centralize baseline SEO and social metadata.

Exit criteria:

- Shared pages use semantic landmarks and accessible navigation.
- The shell works deliberately on desktop, tablet, and phone.
- No site-wide behavior depends on the retired frontend stack.

### 3. Article system and editorial components

**Status:** Not started

Scope:

- Create the unified article layout and modern variants for photo, books, instructional, podcast, and remote content.
- Add decks, heroes, dates, topics, tags, tables of contents, related content, and disclosures.
- Add reusable note, warning, update, recommendation, product, figure, caption, code, and wide-media components.
- Add Article/BlogPosting structured data.

Exit criteria:

- Representative posts from every historical layout render correctly.
- Article pages have exactly one H1 and a valid heading hierarchy.
- Existing content remains readable before individual archive migration.

### 4. Taxonomy, homepage, and archives

**Status:** Not started

Scope:

- Assign a primary topic to every post while preserving existing tags.
- Create useful topic landing pages.
- Build featured, recent, topic, archive, and Gear entry points on the homepage.
- Retain existing tag and pagination URLs.

Exit criteria:

- Every post is discoverable through chronology and topic/tag navigation.
- Homepage selections follow documented deterministic or editorial rules.

### 5. Images, accessibility, and performance

**Status:** Not started

Scope:

- Add explicit image dimensions and responsive derivatives.
- Audit alt text and captions across the archive.
- Improve hero loading, lazy loading, font loading, and layout stability.
- Preserve small historical images at appropriate display sizes.

Exit criteria:

- Every published image has intentional alternative-text treatment.
- Representative pages pass agreed performance and layout-shift checks.

### 6. Products and Gear

**Status:** Not started

Scope:

- Add a merchant-neutral product data model.
- Modernize affiliate disclosure and recommendation presentation.
- Create curated Gear pages.
- Preserve valid historical affiliate destinations during selective migration.

Exit criteria:

- Product components support multiple merchants and firsthand-use metadata.
- Affiliate UI remains visually subordinate to editorial content.

### 7. Search and automation

**Status:** Not started

Scope:

- Add static site search.
- Add reviewed related-post and metadata suggestion workflows.
- Automate checks for titles, descriptions, headings, canonicals, structured data, links, images, and oversized assets.

Exit criteria:

- Search covers the intended archive and requires minimal client JavaScript.
- Quality checks run reproducibly and fail usefully.

### 8. Complete archive migration

**Status:** Not started

Scope:

- Review and modernize every post and standalone page in controlled batches.
- Add topics, descriptions, callouts, related items, image metadata, and corrected headings and links.
- Modernize both calculators visually while leaving their URLs and standalone behavior intact.

Exit criteria:

- Every row in `content-inventory.csv` is marked complete.
- No visibly legacy layouts remain.
- All archive-wide automated and manual QA passes.

### 9. Final QA and launch

**Status:** Not started

Scope:

- Complete desktop, tablet, and phone visual review.
- Verify production URLs, redirects, analytics decision, feeds, sitemap, robots, social cards, structured data, accessibility, and performance.
- Remove temporary compatibility code and unused legacy assets only after verification.

Exit criteria:

- Production deployment passes smoke tests and URL checks.
- Launch decisions and remaining follow-up work are recorded.

## Deferred work

- Move the calculators to a subdomain or another tools-oriented URL structure. Until that decision is made, preserve `/flat-trim/` and `/running-calculator/` exactly.
