# There4 Modernization — Working TODO

Last updated: 2026-08-29

This is the concise handoff list for work remaining after the main modernization. It is project documentation and is excluded from the published site.

## Next session

- [ ] Merge and deploy PR #30, which qualifies affiliate links, adds the structured-data author URL, and repairs two historical 404s.
- [ ] Confirm the production build succeeds and smoke-test both repaired URLs.
- [ ] In Google Search Console, validate the 404 fix after Google sees the deployment.
- [ ] Use URL Inspection and request indexing for these substantial articles:
  - Beginning Woodworking Tools
  - A Simple Complexity Test
  - Reducing Complexity by Refactoring with Guard Clauses
  - Beginning Mountain Biking in 2019
- [ ] Export page-filtered query reports for the WEN 4214 review and other priority landing pages before rewriting titles or descriptions.

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
