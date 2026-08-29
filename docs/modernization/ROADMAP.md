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

**Status:** Complete

Scope:

- Implement design tokens, typography, navigation, footer, and responsive shell.
- Integrate the authentic There4 wordmark when available.
- Replace Bootstrap, LESS, Grunt, jQuery, Font Awesome, and obsolete browser shims.
- Centralize baseline SEO and social metadata.

Exit criteria:

- Shared pages use semantic landmarks and accessible navigation.
- The shell works deliberately on desktop, tablet, and phone.
- No site-wide behavior depends on the retired frontend stack.

Completion evidence:

- The shared default, page, and post layouts use semantic header, navigation, main, article, and footer landmarks with a keyboard skip link and current-page navigation state.
- `css/site.css` provides the responsive editorial design system without external fonts, icon fonts, Bootstrap, or global JavaScript.
- Shared metadata now includes canonical, description, Open Graph, Twitter card, feed, theme-color, and favicon fields.
- Grunt and LESS build sources were removed; legacy public asset files remain unreferenced only to preserve Phase 0 URL parity.
- `bin/verify` passes with all 705 baseline URLs, 707 current public files, and no new generated HTML quality regressions.

### 3. Article system and editorial components

**Status:** Complete

Scope:

- Create the unified article layout and modern variants for photo, books, instructional, podcast, and remote content.
- Add decks, heroes, dates, topics, tags, tables of contents, related content, and disclosures.
- Add reusable note, warning, update, recommendation, product, figure, caption, code, and wide-media components.
- Add Article/BlogPosting structured data.

Exit criteria:

- Representative posts from every historical layout render correctly.
- Article pages have exactly one H1 and a valid heading hierarchy.
- Existing content remains readable before individual archive migration.

Completion evidence:

- All published posts route through a shared semantic article frame; book and instructional layouts retain specialized rendering, while photo, podcast, and remote entries now provide complete local landing pages.
- Shared article headers support decks, published and updated dates, topics, tags, curated tables of contents, and decorative heroes.
- Reusable callout, disclosure, product, figure, related-writing, and adjacent-article components are documented in `EDITORIAL-COMPONENTS.md`.
- Every generated article has exactly one H1, including the three historical posts corrected in this phase.
- Every dated page emits valid `BlogPosting` JSON-LD, and generated JSON-LD parses successfully across the site.
- `bin/verify` preserves all 705 baseline public URLs and reports no new generated HTML quality regressions.

### 4. Taxonomy, homepage, and archives

**Status:** Complete

Scope:

- Assign a primary topic to every post while preserving existing tags.
- Create useful topic landing pages.
- Build featured, recent, topic, archive, and Gear entry points on the homepage.
- Retain existing tag and pagination URLs.

Exit criteria:

- Every post is discoverable through chronology and topic/tag navigation.
- Homepage selections follow documented deterministic or editorial rules.

Completion evidence:

- Every published post resolves to Machines, Making, Software, or Reading & Life through explicit front matter or its preserved first tag; historically untagged posts received explicit assignments.
- Four `/topics/` collection pages list all published posts in their area and link to the applicable legacy tags.
- The homepage features the newest post, the next seven recent posts, all four topic entry points, the complete archive, and a restrained Gear/tools entry point.
- `/posts/` provides topic, tag, and chronological discovery, while tag listings now use local durable post URLs.
- Existing `/tags/` and `/page2/` through `/page8/` routes remain present and useful; the Python and Tools tag-page mapping defects were corrected.
- `bin/verify` preserves all 705 baseline public URLs, generates 711 current files, and reports no new HTML quality regressions.

### 5. Images, accessibility, and performance

**Status:** Complete

Scope:

- Add explicit image dimensions and responsive derivatives.
- Audit alt text and captions across the archive.
- Improve hero loading, lazy loading, font loading, and layout stability.
- Preserve small historical images at appropriate display sizes.

Exit criteria:

- Every published image has intentional alternative-text treatment.
- Representative pages pass agreed performance and layout-shift checks.

Completion evidence:

- Every generated image has alt, width, height, loading, and decoding attributes; verification now fails if any of these regress.
- Authored alternative text is preserved. Previously unlabeled legacy product-list images are explicitly presentational because nearby captions and article text provide their context.
- Page and article heroes are real eager, high-priority images rather than CSS backgrounds; repeated cards and article media load lazily.
- All 80 editorial headers have 640px and 1280px WebP derivatives, as do the 27 rendered inline originals that exceeded 500 KB.
- Responsive `srcset` and `sizes` are emitted when derivatives exist, while original URLs remain fallback sources and link destinations.
- `bin/verify` preserves all 705 baseline URLs, generates 925 current files, and reports no new HTML quality regressions.

### 6. Products and Gear

**Status:** Complete

Scope:

- Add a merchant-neutral product data model.
- Modernize affiliate disclosure and recommendation presentation.
- Create curated Gear pages.
- Preserve valid historical affiliate destinations during selective migration.

Exit criteria:

- Product components support multiple merchants and firsthand-use metadata.
- Affiliate UI remains visually subordinate to editorial content.

Completion evidence:

- `/gear/` curates eight evidence-backed records across Shop, Bikes & Outdoors, Machines, and Computing, with a permanent header navigation entry and homepage path.
- Each record includes firsthand experience, a conservative documented-since date, recommendation context, a supporting There4 article, and optional explicitly labeled merchant destinations.
- Five product-heavy articles link back to their relevant Gear records without inserting merchant calls to action into the article body.
- The model supports multiple merchants, prohibits stored prices, and presents internal field notes before purchase destinations.
- The concise sitewide and full Gear-page disclosures explain affiliate treatment without overwhelming editorial content.
- `scripts/verify_gear.rb` enforces model integrity and runs in `bin/verify`; all eight records and article references pass.
- `bin/verify` preserves all 705 baseline public URLs, generates 926 current files, and reports no new HTML quality regressions.

### 7. Search and automation

**Status:** Complete

Scope:

- Add static site search.
- Add lightweight article reading-state behavior: as a section enters view, emphasize its matching desktop sidebar table-of-contents link and expose the current section accessibly.
- Add reviewed related-post and metadata suggestion workflows.
- Automate checks for titles, descriptions, headings, canonicals, structured data, links, images, and oversized assets.

Exit criteria:

- Search covers the intended archive and requires minimal client JavaScript.
- Sidebar table-of-contents tracking works with keyboard navigation, respects reduced-motion preferences, and leaves the no-JavaScript reading experience intact.
- Quality checks run reproducibly and fail usefully.

Completion evidence:

- `/search/` searches a generated index of all 76 published articles by title, description, primary topic, tag, and year without sending queries to an external service.
- The search interface uses semantic form and status markup, keeps query state in a shareable `?q=` parameter, limits rendering to 50 ranked results, and retains a no-JavaScript path to the complete writing archive.
- Curated article tables of contents now mark the current section with `aria-current="location"`, a bold treatment, the There4 `∴` marker, and visually hidden current-section text; all original anchor navigation remains intact without JavaScript.
- `scripts/editorial_suggestions.rb` analyzes every published post and emits an optional CSV review queue for missing metadata and related-writing candidates without changing content.
- The generated-site audit now tracks empty or long titles and descriptions, malformed canonical URLs and JSON-LD, broken links, heading structure, image attributes, and assets over 1.5 MB as regression-protected quality debt.
- Dedicated search and reading-state verifiers check all 76 indexed destinations and all seven curated section links; `bin/verify` preserves all 705 baseline URLs and reports no new generated quality regressions.

### 8. Complete archive migration

**Status:** Complete

Scope:

- Review and modernize every post and standalone page in controlled batches.
- Add topics, descriptions, callouts, related items, image metadata, and corrected headings and links.
- Preserve both calculators byte-for-byte; their redesign and possible subdomain move remain deferred.

Exit criteria:

- Every editorial row in `content-inventory.csv` is marked complete; both calculator rows remain explicitly preserved.
- No visibly legacy layouts remain.
- All archive-wide automated and manual QA passes.

Progress evidence:

- All 76 published articles now declare an explicit primary topic and durable meta description; the inventory records the shared-layout and image-accessibility work already completed in earlier phases.
- The two calculator source files are checksum-protected and marked `preserved`; the unpublished historical article is explicitly excluded rather than treated as published work.
- Phase 8 batching, editorial rules, and calculator checksums are recorded in `ARCHIVE-MIGRATION.md`.
- The Software batch is complete: 29 articles have refined descriptions, reviewed headings and links, 87 curated related-writing destinations, 22 contextual archive notes, and local syntax-highlighted replacements for all nine former Gist embeds.
- The Machines batch is complete: 19 articles have refined descriptions, reviewed structure and links, 57 curated related-writing destinations, and 17 focused archive or safety notes for fitment, mechanical, route, and protective-equipment context.
- The Making batch is complete: 14 articles have refined descriptions, reviewed structure and links, 39 curated related-writing destinations, and 11 focused notes for product availability, electrical work, structural loading, and machine safety.
- The Reading & Life batch is complete: 14 articles have refined descriptions, reviewed specialized layouts and links, 42 curated related-writing destinations, and five edition-aware notes on reading lists without burdening photo or reflective work.
- Final reconciliation is complete: all 114 generated HTML files pass the route-aware quality audit with no findings, all modern standalone and collection routes emit structured data, and intentional redirects and checksum-protected calculators remain outside modern-page requirements.
- Five genuine internal-reference defects were corrected without changing public article URLs; large original images remain available while rendered images are verified for responsive delivery.

### 9. Final QA and launch

**Status:** Complete

Scope:

- Complete desktop, tablet, and phone visual review.
- Verify production URLs, redirects, analytics decision, feeds, sitemap, robots, social cards, structured data, accessibility, and performance.
- Remove temporary compatibility code and unused legacy assets only after verification.

Exit criteria:

- Production deployment passes smoke tests and URL checks.
- Launch decisions and remaining follow-up work are recorded.

Release-candidate evidence:

- The full build and verification suite passes, including a new launch-artifact gate for a ten-item RSS feed, 108 unique sitemap locations, sitemap exclusions, and the robots sitemap declaration.
- Production smoke tests pass on `https://there4.io` for the homepage, archives, a representative article, compatibility redirects, both calculators, feed, sitemap, robots, HTTPS enforcement, and the custom 404 response.
- Representative homepage, archive, article, and search routes were reviewed at 1440-pixel desktop, 820-pixel tablet, and 390-pixel phone widths with no horizontal overflow, broken images, landmark/H1 failures, or console errors.
- Search query state and results, article table-of-contents reading state, reduced-motion support, canonical metadata, social cards, and structured data were checked in rendered output.
- Production CSS is served gzip-compressed through the CDN; the shared CSS payload is about 32 KB uncompressed, and page-specific JavaScript remains small and conditional.
- No analytics is included. Search stays local to the browser, and the site sends no first-party visitor telemetry.
- Unreferenced legacy CSS, JavaScript, and Glyphicon files remain as unloaded compatibility assets because their public paths are part of the protected URL baseline; removal is deferred until an explicit asset-retirement policy is accepted.
- The merged Phase 9 release deployed successfully. Post-deploy checks confirmed all representative routes, the HTTPS redirect, custom 404, ten-entry feed, 108-location sitemap, robots declaration, compatibility redirects, and byte-identical calculator files.
- The unresolved `www` hostname decision and platform-level defensive response headers remain recorded infrastructure follow-ups; neither changes the verified canonical apex release.

## Deferred work

- Redesign the calculators and potentially move them to a subdomain or another tools-oriented URL structure. Until that decision is made, preserve `/flat-trim/` and `/running-calculator/` byte-for-byte at their current URLs.
