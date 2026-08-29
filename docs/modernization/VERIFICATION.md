# Build and Verification

Phase 0 protects the current production surface before dependency and template changes begin.

## Production-equivalent build

```sh
bundle exec jekyll build -d ./public
```

## Verify against the baseline

Run after building:

```sh
ruby scripts/verify_site.rb verify --site public
```

The verification fails when:

- A file URL present in the Phase 0 baseline disappears.
- A new broken internal reference is introduced.
- A new heading, metadata, semantic-landmark, or image-markup issue is introduced.
- A title or description is empty or grows beyond the review thresholds.
- A canonical URL or JSON-LD block is malformed.
- A new generated asset exceeds 1.5 MB.
- Project-only `bin/`, `docs/`, `scripts/`, or `test/` content appears in generated output.

The current site's known quality problems are captured as baseline debt rather than ignored. Fixing a baseline issue does not fail verification. After an intentional correction, regenerate the quality snapshot in the same reviewed change so the issue cannot return.

## Refresh the baseline

Only refresh the baseline after reviewing the generated differences:

```sh
ruby scripts/verify_site.rb snapshot --site public
git diff -- test/baseline
```

Removing a historical public URL from the baseline requires an explicit redirect or a recorded decision. New files do not require a baseline refresh unless they should become protected production URLs.

When adding a new quality check without changing the Phase 0 URL contract, capture only the reviewed quality debt:

```sh
ruby scripts/verify_site.rb snapshot --site public --quality-only
```

## Baseline contents

- `test/baseline/public-urls.txt` protects generated files, including HTML routes, original images, feeds, assets, redirects, and both calculators.
- `test/baseline/quality-report.json` records current generated HTML debt for regression comparison.

## Full Phase 0 check

```sh
bin/verify
```

The expanded commands remain documented above for diagnosis and baseline maintenance.

## Editorial review queue

Generate a non-mutating CSV of metadata and related-writing suggestions:

```sh
ruby scripts/editorial_suggestions.rb --output tmp/editorial-suggestions.csv
```

Suggestions are a review queue, never automatic edits. Shared topics and tags provide candidates; a person decides what belongs in an article. `bin/verify` runs the workflow in check mode to ensure every published post remains analyzable.

## Continuous integration

GitHub Actions runs `bin/verify` for every pull request and push to `master` on Ubuntu 22.04 with the repository-pinned Ruby toolchain. The same command builds the site and runs URL, metadata, structured-data, image, archive, search, reading-state, feed, sitemap, and robots checks.
