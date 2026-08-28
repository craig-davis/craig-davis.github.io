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

## Decision template

### D-NNN — Title

**Status:** Proposed, accepted, superseded, or rejected  
**Decision:** What was decided.  
**Reason:** Why it was selected.  
**Consequences:** Important tradeoffs or follow-up work.
