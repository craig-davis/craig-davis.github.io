# Archive Migration

Phase 8 reviews the editorial archive in controlled, independently verifiable batches. A row is complete only after its metadata, structure, media treatment, related writing, links, generated output, and representative visual presentation have been reviewed.

## Scope

- 76 published articles
- One unpublished historical article retained in source but excluded from generated-site review
- A final spot review of standalone editorial pages already modernized in earlier phases
- No calculator redesign

## Protected calculators

The calculators remain byte-for-byte unchanged during Phase 8:

| Path | SHA-256 at Phase 8 start |
| --- | --- |
| `flat-trim/index.html` | `f9959988cd057900598cbd7dd502bd67bd6e48dbf0e4d40bcbfee11528c23a50` |
| `running-calculator/index.html` | `edc1ba7e03658536e8cb5a06c3d22b68e0c4c7cc058bfc0ec5fe6b21e3379178` |

`scripts/verify_archive.rb` enforces these checksums as well as the protected URLs.

## Batches

1. Archive-wide explicit topics and descriptions — complete
2. Software articles — complete
3. Machines articles — complete
4. Making articles — complete
5. Reading & Life articles — complete
6. Standalone editorial-page spot review and final inventory reconciliation

Each content batch reviews headings, optional curated navigation, figures and captions, callouts, disclosures, related writing, links, and rendered QA. Batch commits may be released independently while Phase 8 remains active.

## Software batch evidence

- 29 published articles reviewed
- 29 descriptions refined to 50–180 characters
- 87 deliberate related-writing destinations
- 22 article-specific archive notes for materially dated platforms and APIs
- Two articles corrected to remove H1-to-H3 heading jumps
- Nine remote Gist embeds replaced by locally rendered Rouge snippets
- `jekyll-gist` and its unused API dependencies removed
- Hack's four subset web-font styles self-hosted for code, with a warm high-contrast Rouge palette approved against representative SQL and PHP articles

## Machines batch evidence

- 19 published articles reviewed
- 19 descriptions refined to 50–180 characters
- 57 deliberate related-writing destinations across Jeep, motorcycle, and bicycle field notes
- 17 article-specific archive and safety notes where fitment, traffic, product availability, or mechanical risk materially affects current use
- All generated heading hierarchies reviewed without a level jump
- The visible “Ugrade” title typo corrected while preserving its historical public URL

## Reading & Life batch evidence

- 14 published articles reviewed across photo essays, reading lists, podcasts, professional development, and reflective writing
- 14 descriptions refined to 50–180 characters
- 42 deliberate related-writing destinations, including useful connections back to Software and Machines
- Five edition-aware archive notes on reading lists; photo, travel, podcast, and reflective entries remain free of unnecessary warnings
- Specialized photo, podcast, and books layouts reviewed as structured content rather than mistaken for empty article bodies

## Making batch evidence

- 14 published articles reviewed
- 14 descriptions refined to 50–180 characters
- 39 deliberate related-writing destinations across shop projects, tools, recipes, and practical builds
- 11 focused archive, availability, electrical, structural, or machine-safety notes; timeless recipes remain free of unnecessary warnings
- All generated heading hierarchies reviewed without a level jump

## Editorial rules

- Preserve publication dates, durable URLs, and the historical meaning of the article.
- Correct clear spelling, markup, accessibility, and dead-link defects without pretending old tools or services are current.
- Use an update or archival note when age materially changes how a reader should interpret instructions.
- Related writing is selected for reader value, not simply because two posts share a tag.
- Do not silently replace Craig's claims or firsthand voice with generated editorial assertions.
