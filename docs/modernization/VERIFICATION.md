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
- Project-only `bin/`, `docs/`, `scripts/`, or `test/` content appears in generated output.

The current site's known quality problems are captured as baseline debt rather than ignored. Fixing a baseline issue does not fail verification. After an intentional correction, regenerate the quality snapshot in the same reviewed change so the issue cannot return.

## Refresh the baseline

Only refresh the baseline after reviewing the generated differences:

```sh
ruby scripts/verify_site.rb snapshot --site public
git diff -- test/baseline
```

Removing a historical public URL from the baseline requires an explicit redirect or a recorded decision. New files do not require a baseline refresh unless they should become protected production URLs.

## Baseline contents

- `test/baseline/public-urls.txt` protects generated files, including HTML routes, original images, feeds, assets, redirects, and both calculators.
- `test/baseline/quality-report.json` records current generated HTML debt for regression comparison.

## Full Phase 0 check

```sh
bin/verify
```

The expanded commands remain documented above for diagnosis and baseline maintenance.

## Continuous integration

Repository-hosted CI is deferred until Phase 1 pins a supported Ruby/Jekyll toolchain. DigitalOcean remains the deployment builder during Phase 0. Adding a new workflow around the current Ruby 2.7/Jekyll 3.6 stack would introduce a second legacy runtime problem before the upgrade it is meant to protect.
