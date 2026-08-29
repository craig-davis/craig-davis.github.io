# There4 Modernization Decisions

Record decisions that materially affect architecture, content, design, deployment, or migration. Append new entries; do not silently rewrite prior decisions after implementation depends on them.

## D-001 — Remain on Jekyll

**Status:** Accepted  
**Decision:** Modernize the existing Jekyll site rather than migrate to another CMS or an SPA framework.  
**Reason:** Static, semantic output fits the archive, hosting model, maintenance goals, and URL-preservation requirements.

## D-002 — Complete archive modernization

**Status:** Accepted  
**Decision:** Modernize all posts and standalone pages, including metadata, related content, callouts, imagery, and specialized layouts.  
**Reason:** A permanent compatibility-only treatment would leave the archive visually and structurally inconsistent.

## D-003 — Preserve calculator URLs for now

**Status:** Accepted  
**Decision:** Keep `/flat-trim/` and `/running-calculator/` in place during the main modernization. Treat them as standalone tools and include them in URL regression checks.  
**Reason:** A future tools subdomain may be desirable, but its URL and redirect strategy has not been designed.

## D-004 — Keep project documents private from the generated site

**Status:** Accepted  
**Decision:** Store project records under `docs/modernization/` and exclude the entire `docs` directory in `_config.yml`.  
**Reason:** The records should be versioned with the code without becoming public site content.

## D-005 — Defer hosted CI until the supported runtime is pinned

**Status:** Accepted  
**Decision:** Use the repository-local `bin/verify` gate during Phase 0 and add hosted CI as part of the supported Ruby/Jekyll foundation in Phase 1.  
**Reason:** The current Ruby 2.7/Jekyll 3.6 stack is the legacy system being replaced. A new workflow tied to it would add brittle runtime setup without improving the DigitalOcean deployment contract.

## D-006 — Pin Ruby 3.4.7 and Jekyll 4.4.1

**Status:** Accepted

**Decision:** Use Ruby 3.4.7 and Jekyll 4.4.1 for local builds, GitHub Actions, and DigitalOcean App Platform.

**Reason:** Jekyll 4.4 recommends Ruby 3.2 or newer. Ruby 3.4.7 is installed locally and is within DigitalOcean's documented Ubuntu-22 Ruby buildpack support range, allowing the same exact runtime to be verified before deployment. Jekyll 4.4.1 is the current stable Jekyll release.

**Consequences:** Ruby patch updates remain deliberate dependency-maintenance changes. The repository no longer supports building with Ruby 2.7.

## D-007 — Preserve rendering during the toolchain upgrade

**Status:** Accepted

**Decision:** Accept only renderer-generated markup differences required by the Jekyll 4 toolchain during Phase 1; do not redesign templates or content.

**Reason:** Separating build modernization from visual redesign makes failures attributable and keeps Phase 1 reviewable. The observed differences are syntax-highlighter token classes, inline-code language classes, and feed generator/build timestamps; URLs and quality checks remain stable.

## D-008 — Do not carry Windows-only Ruby dependencies

**Status:** Accepted

**Decision:** Remove `tzinfo-data` rather than maintain Windows platform declarations in the Gemfile.

**Reason:** There4 builds on macOS and Linux. The dependency is unnecessary on both platforms, and its modern Bundler platform alias was incompatible with DigitalOcean's legacy Bundler 2.3.10 parser.

## D-009 — Make the therefore sign part of the There4 identity

**Status:** Accepted

**Decision:** Use the literal Unicode therefore sign (`U+2234`, `∴`) with the THERE4.IO wordmark and Craig Davis byline in the shared site identity.

**Reason:** The symbol is an intentional expression of the site's name, not a replaceable decorative icon. Keeping it as text makes the mark crisp, accessible, and independent of an image asset.

## D-010 — Use a quiet, self-hosted editorial design system

**Status:** Accepted

**Decision:** Build the shared shell with warm paper, ink, and rust color tokens; system serif, sans-serif, and monospace type stacks; semantic HTML; and CSS-driven responsive behavior. Do not depend on a font CDN, icon font, global JavaScript, or dark mode in this phase.

**Reason:** The approach supports the practical, photographic character of the archive while reducing privacy, performance, and maintenance costs.

## D-011 — Retain legacy public asset URLs temporarily

**Status:** Accepted

**Decision:** Remove the excluded Grunt and LESS build sources, but keep legacy CSS, JavaScript, font, and renamed npm-manifest files present and unreferenced until the final compatibility cleanup.

**Reason:** Phase 0 recorded those files as public URLs. Removing them during the shell redesign would violate URL parity even though the modern site no longer loads them.

**Consequences:** The files are inert compatibility artifacts, not part of the active frontend. Phase 9 will decide whether to remove them and deliberately update the URL baseline.

## D-012 — Unify articles without rewriting the archive

**Status:** Accepted

**Decision:** Route standard, book, instructional, photo, podcast, and remote entries through one shared article frame. Keep specialized content generation in thin child layouts and make tables of contents opt-in and curated.

**Reason:** Shared headers, metadata, topics, navigation, and related writing should behave consistently, while historical structured data such as books and instruction steps still needs purpose-built rendering. Curated tables of contents avoid noisy automatic navigation and can be added during editorial review.

**Consequences:** Existing articles gain the modern frame immediately. Detailed callout, figure, product, and metadata migration remains incremental, and image-dimension work remains in Phase 5.

## D-013 — Add four primary editorial topics above legacy tags

**Status:** Accepted

**Decision:** Organize the archive into Machines, Making, Software, and Reading & Life. Resolve a post's primary topic from an explicit `topic` value when present, otherwise from the topic assigned to its first legacy tag. Preserve all existing tags and `/tags/` URLs.

**Reason:** Four stable areas make the breadth of the site understandable without discarding the specific vocabulary readers already use. Explicit overrides cover cross-disciplinary and historically untagged posts without forcing artificial tags.

## D-014 — Keep homepage selection deterministic

**Status:** Accepted

**Decision:** Feature the newest published post, then show the next seven posts as recent writing. Link the four primary topics, complete archive, and existing tools/gear tag directly from the homepage. Keep paginated archive URLs and render their original chronological slices.

**Reason:** A deterministic rule keeps the homepage current without adding a manual curation chore. Editorial pinning can be introduced later if the automatic choice proves limiting.

## D-015 — Derive intrinsic image metadata during the build

**Status:** Accepted

**Decision:** Read intrinsic JPEG, PNG, and GIF dimensions from local assets during Jekyll rendering and add missing width, height, decoding, and loading attributes to generated image markup. Treat legacy images that lack authored alt text as presentational only when the surrounding caption or article text already supplies their context.

**Reason:** Hundreds of historical images use several Markdown and raw-HTML forms. A build-time compatibility layer provides consistent layout stability and loading behavior without a risky mass rewrite, while new and selectively migrated figures can carry richer authored metadata.

## D-016 — Generate responsive derivatives where they matter most

**Status:** Accepted

**Decision:** Provide 640px and 1280px WebP variants for all editorial header images and for rendered post images at least 500 KB in their original form. Keep original assets as durable fallbacks and link targets.

**Reason:** Headers affect initial rendering across the entire site, while the largest inline originals account for the clearest remaining bandwidth risk. Targeted derivatives deliver most of the value without duplicating the complete 215 MB historical image archive.

## D-017 — Separate Gear recommendations from merchant links

**Status:** Accepted

**Decision:** Store curated gear as merchant-neutral records with firsthand-use evidence, a documented-since date, recommendation context, a supporting There4 article, and zero or more explicitly affiliated merchant destinations. Do not store prices.

**Reason:** The durable editorial claim is that an item earned a place through use. Retailers, availability, product revisions, and prices change independently and should remain subordinate optional destinations.

**Consequences:** Historical affiliate links remain in their original prose. Gear curation is selective and can grow only when an article supports the recommendation; “documented since” does not imply current availability or unchanged specifications.

## D-018 — Keep search local and editorial automation review-only

**Status:** Accepted

**Decision:** Generate a compact search index at build time and search it with dependency-free browser JavaScript. Generate metadata and related-writing candidates as a review queue; never modify article content automatically.

**Reason:** Static local search preserves the site's privacy, deployment model, and no-service maintenance profile. Editorial relationships and descriptions require judgment, so automation should surface useful work without publishing machine choices as Craig's voice.

**Consequences:** Search covers published articles and gracefully falls back to the complete archive without JavaScript. Phase 8 can consume the suggestion queue in controlled batches while the generated-site checks prevent new quality debt.

## D-019 — Preserve calculators during archive migration

**Status:** Accepted

**Decision:** Exclude both calculators from Phase 8 redesign and protect their current files byte-for-byte in addition to preserving their public URLs.

**Reason:** The calculators are standalone applications with a separate future design and hosting decision. Editorial archive work should not accidentally change their behavior or presentation.

**Consequences:** `/flat-trim/` and `/running-calculator/` remain unchanged. Their redesign and any subdomain move stay deferred until explicitly authorized.

## D-020 — Self-host article code and highlight at build time

**Status:** Accepted

**Decision:** Replace remote Gist embeds with repository-owned snippets rendered by Jekyll and Rouge. Do not add a browser-side syntax-highlighting library.

**Reason:** Code is part of the article and should remain readable without a third-party request or live Gist. Rouge is already present in Jekyll, produces static semantic markup, and adds no runtime JavaScript or privacy dependency.

**Consequences:** Nine Software articles now carry their snippets locally, Gist build warnings are eliminated, and the unused `jekyll-gist` dependency is removed. Verification rejects future Gist tags in published posts.

## D-021 — Use self-hosted Hack and a restrained dark code palette

**Status:** Accepted

**Decision:** Use Hack for inline and block code, serving the official regular, bold, italic, and bold-italic subset WOFF2 files locally. Apply a warm dark Rouge palette with no token color below a 6.67:1 contrast ratio against the code background.

**Reason:** Hack is purpose-built for source code, while local font files preserve the site's privacy and deployment independence. The former light-theme token colors became muddy and overly saturated on There4's dark code panels.

**Consequences:** Browsers request Hack only when monospace content is rendered and only fetch styles the page uses. Prose typography is unchanged, font loading uses `swap`, ligatures are disabled in code blocks, and no font CDN is introduced.

## D-022 — Distinguish firsthand machine notes from current safety guidance

**Status:** Accepted

**Decision:** Preserve vehicle, motorcycle, bicycle, and route articles as firsthand field notes while adding focused context wherever current fitment, service information, traffic conditions, regulations, or safety procedures must take precedence.

**Reason:** Historical mechanical experience remains useful, but readers should not mistake a single installation or route report for current manufacturer instructions, professional inspection, or live road conditions.

**Consequences:** Safety notes are specific to the risk and remain visually subordinate to the article. They do not turn ordinary narrative posts into warning pages or erase Craig's original observations.

## Decision template

### D-NNN — Title

**Status:** Proposed, accepted, superseded, or rejected  
**Decision:** What was decided.  
**Reason:** Why it was selected.  
**Consequences:** Important tradeoffs or follow-up work.
