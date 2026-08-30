# There4 Modernization — Working TODO

Last updated: 2026-08-29

This is the concise handoff list for work remaining after the main modernization. It is project documentation and is excluded from the published site.

## Next session

- [ ] Merge and deploy PR #31, which repairs two historical 404s and records the post-modernization handoff. PR #30, containing the affiliate-link and structured-data fixes, is already merged.
- [ ] Confirm the production build succeeds and smoke-test both repaired URLs.
- [ ] In Google Search Console, validate the 404 fix after Google sees the deployment.
- [ ] Use URL Inspection and request indexing for these substantial articles:
  - Beginning Woodworking Tools
  - A Simple Complexity Test
  - Reducing Complexity by Refactoring with Guard Clauses
  - Beginning Mountain Biking in 2019
- [ ] Export page-filtered query reports for the WEN 4214 review and other priority landing pages before rewriting titles or descriptions.

## New article backlog

- [ ] Debugging Like a Doctor.
- [ ] Garbage Can Wheels.
- [ ] History of Northfork Mountain Biking, with photos; decide whether it should be a single feature or a series.
- [ ] Podcast from Periodic Sources.
- [ ] Smith sunglasses and other glasses; shape this as a firsthand review or comparison.
- [ ] Small carpentry essentials: pencil, flat bar, notebook, bit holder, shims, pliers, and beater chisel.
- [ ] Door-hinge tool and other weird or specialized tools; refine the angle and title.
- [ ] Is AI an Exoskeleton or a Coworker?

## Article updates and new reviews

- [ ] Update the keyboard-binding article with the new implementation that does not require Karabiner.
- [ ] Update the motorcycle-tools article for the new tool bag.
- [ ] Write a motorcycle dry-bags review.
- [ ] Write a carpenter tool-bag review.

## Editorial planning and site enhancements

- [ ] Propose and prioritize the next group of existing-article updates.
- [ ] Propose and prioritize the next group of new articles.
- [ ] Decide publication-date policy for articles based on older work: publish with the current date, backdate, or show separate event/work and publication dates.
- [ ] Add an accessible Return to top link or control to long pages.
- [ ] Create a There4 voice-and-tone document to guide new articles, archive updates, calls to action, and AI-assisted editing.

## Search and editorial opportunities

- [ ] Investigate the WEN 4214 Drill Press review first: about 50,000 impressions, 31 clicks, and a 0.06% CTR in the 16-month Search Console export.
- [ ] Review search intent, titles, descriptions, and article openings for:
  - Jeep XJ Transmission Cooler Line Upgrade
  - Delta Unisaw Shark Guard
  - Bosch 4100 Router Table Insert
  - Jeep XJ Brown Dog Motor Mounts
- [ ] Revisit the deferred homepage Recent Articles and Popular Topics treatment.
- [ ] Re-export Search Console performance after enough post-launch data accumulates and compare against the 2026-08-29 baseline.

## Affiliate and conversion work

- [ ] Craig: enroll in the additional affiliate programs and record approved merchant destinations.
- [ ] Add merchant-neutral product callouts only after approved destinations exist.
- [ ] Design a visually distinctive product callout for carefully selected, firsthand Amazon recommendations; keep it subordinate to the article, clearly label it as affiliate content, and make it feel more intentional than an ordinary product link.
- [ ] Prioritize commercial-intent articles that already receive search traffic; keep editorial field notes primary.
- [ ] Confirm affiliate disclosures and `rel="sponsored"` remain correct whenever a new merchant is added.

## Infrastructure and deferred product work

- [ ] Resolve the `www.there4.io` App Platform domain and redirect configuration.
- [ ] Decide whether to add platform-level defensive response headers.
- [ ] Decide on an asset-retirement policy before removing preserved legacy public files.
- [ ] Redesign the two calculators later; preserve `/flat-trim/` and `/running-calculator/` unchanged until their destination and possible subdomain are decided.

## Search Console findings requiring no action now

- Leave the seven bogus or obsolete video/player URLs as 404 responses.
- Do not redirect query-string, HTTP, missing-trailing-slash, tag, pagination, or non-HTML asset exclusions merely to make the coverage report smaller.
- Short photo and podcast notes may legitimately remain unindexed unless they gain substantial new editorial content.
