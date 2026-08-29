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

## Decision template

### D-NNN — Title

**Status:** Proposed, accepted, superseded, or rejected  
**Decision:** What was decided.  
**Reason:** Why it was selected.  
**Consequences:** Important tradeoffs or follow-up work.
