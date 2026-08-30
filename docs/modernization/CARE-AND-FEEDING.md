# There4 Care and Feeding

This is the operating manual for writing, updating, previewing, and publishing There4. Project documents under `docs/` are excluded from the generated site.

## The short version

For an ordinary article:

1. Start a branch from the latest `master`.
2. Add a dated Markdown file under `_posts/`.
3. Put the original photographs under `img/posts/<article-slug>/` and the hero under `img/headers/`.
4. Run `bin/prepare-image` for the hero and any large inline photographs.
5. Write specific alt text and useful captions.
6. Preview with `bin/serve` and review desktop and phone widths.
7. Run `bin/verify`.
8. Commit the source article, originals, and generated WebP variants; open a pull request.
9. After merge, confirm the DigitalOcean deploy and inspect the production article.

## Local setup

The repository expects:

- Ruby 3.4.7, as declared by `.ruby-version` and `Gemfile`
- Bundler and the gems in `Gemfile.lock`
- ImageMagick for responsive image preparation

On a new Mac:

```sh
brew install ruby@3.4 imagemagick
bundle install
```

Use the Ruby installation or version manager that already works on the machine. Before diagnosing a Jekyll error, confirm:

```sh
ruby --version
bundle --version
```

The Ruby version must agree with `Gemfile`. Do not loosen the repository version merely to accommodate an older system Ruby.

## Branch and pull-request workflow

Update the local view of `master`, then create a focused branch:

```sh
git fetch origin master
git switch -c codex/article-short-name origin/master
```

Keep unrelated maintenance in separate pull requests. Generated `public/` output is ignored and must not be committed.

## Create an article

Article filenames control their original publication date and URL:

```text
_posts/YYYY-MM-DD-kebab-case-title.markdown
```

Use lowercase words for new filename slugs. Do not rename an existing post merely to improve its slug; historical URLs are durable.

Start with this front matter:

```yaml
---
layout: post
title: "A clear, specific title"
subtitle: "A useful deck that adds context"
description: "A plain-language search and social summary of what the article actually delivers."
date: 2026-08-29
tags: [jeep, tools]
topic: machines
author: "Craig Davis"
header-img: "img/headers/descriptive-name.jpg"
header-alt: "The useful information conveyed by the hero photograph"
---
```

Required editorial fields for a normal new article are `layout`, `title`, `description`, `date`, `topic`, `author`, and usually `header-img`. A subtitle is strongly preferred when it adds information rather than restating the title.

The four primary topics are:

- `machines` — Jeeps, motorcycles, bicycles, skiing gear, and mechanical work
- `making` — woodworking, shop work, tools, repairs, and practical projects
- `software` — engineering, code, systems, teams, and developer practice
- `reading-life` — books, photography, travel, recipes, podcasts, and reflective essays

Use existing tags when they fit. Tag names and their topic mappings live in `_data/tags.yml`. Do not invent several near-duplicate tags for one article.

### Specialized layouts

Use `layout: post` unless the content clearly benefits from an established specialized layout:

- `instructable` for an explicit sequence of steps
- `books` for a structured book collection
- `photo` for a photo essay
- `podcast` for a local entry pointing to an episode
- `remote` for an article whose durable local page points to the full work elsewhere

Inspect a recent article using that layout before adding new fields.

## Publication and update dates

`date` is the article's publication date. Do not backdate a new article simply because the project or photographs are old. When chronology matters, state the project/event date in the prose or use a clearly labeled field after an editorial decision.

For a substantial revision to an existing article, preserve the original `date` and add:

```yaml
lastmod: 2026-08-29
```

The template displays “Updated” and emits the same value as `BlogPosting.dateModified`. Use `lastmod` when the article receives meaningful new facts, results, recommendations, procedures, or sections. Do not change it for CSS work, spelling fixes, link maintenance, or an automatic freshness pass.

## Article structure

Lead with the real situation: what broke, what you wanted, what you noticed, or why the question matters. Give the reader enough context to decide whether the article applies to them.

A practical article usually benefits from:

1. Situation or problem
2. Constraints, fitment, or assumptions
3. Parts, tools, or sources
4. The work in useful sequence
5. What changed during the work
6. Result after real use
7. What you would do differently

Use headings that describe the reader's next question. Prefer curated sections over mechanically chopping prose into many small headings.

Long articles can add a left-rail table of contents:

```yaml
toc:
  - title: The problem
    id: the-problem
  - title: Installation notes
    id: installation-notes
```

Every `id` must match a real heading anchor.

## Photographs and images

### File organization

- Article hero: `img/headers/descriptive-name.jpg`
- Article photographs: `img/posts/article-slug/descriptive-name.jpg`
- Diagrams or transparency-dependent artwork may remain PNG.
- Use lowercase kebab-case names that explain the image without opening it.

The original file remains the durable fallback and possible full-resolution link. It is published publicly. Export photographs without sensitive location metadata; review EXIF/GPS data before committing originals.

### Create WebP variants

Install ImageMagick once:

```sh
brew install imagemagick
```

Then run the checked-in helper on each original:

```sh
bin/prepare-image img/headers/garbage-can-wheels.jpg
bin/prepare-image img/posts/garbage-can-wheels/axle-detail.jpg
```

The helper:

- auto-orients the image
- creates `.<width>.webp` files at 640px and 1280px beside the original
- strips derivative metadata
- never upscales a smaller original
- keeps existing variants unless invoked with `FORCE=1`

To intentionally regenerate variants:

```sh
FORCE=1 bin/prepare-image img/headers/garbage-can-wheels.jpg
```

The default WebP quality is 82. Override it only after visual review:

```sh
WEBP_QUALITY=86 FORCE=1 bin/prepare-image img/headers/garbage-can-wheels.jpg
```

Reference the original JPEG or PNG in the article—not the WebP. The Jekyll image plugin discovers correctly named variants and writes `srcset` and `sizes` automatically.

Aim for a hero original at least 1280px wide. Small historical images can remain small; do not upscale them merely to satisfy a nominal size.

### Insert an inline image

Simple Markdown is appropriate for most article photographs:

```markdown
![The replacement wheel and axle installed under the garbage can](/img/posts/garbage-can-wheels/installed-wheel.jpg)
```

Use the figure component when a caption adds evidence or context:

```liquid
{% raw %}{% include figure.html
  src="/img/posts/garbage-can-wheels/axle-detail.jpg"
  alt="Steel axle passing through the replacement wheel and reinforced can base"
  caption="The washer spreads the load across the repaired plastic base."
%}{% endraw %}
```

Write alt text for the information a reader needs from the image. Do not begin with “image of,” repeat the caption, stuff keywords, or describe irrelevant visual texture. Use `alt=""` only when the image is genuinely decorative and nearby text already carries all meaning.

### Review photographs before publishing

- Confirm orientation and crop at desktop and phone widths.
- Check that the sequence matches the prose.
- Remove near-duplicates that do not teach anything.
- Preserve a wider context photo before close details.
- Confirm every referenced file exists with exact case-sensitive spelling.
- Open the generated WebPs and look for smeared text, banding, or damaged fine detail.

## Reusable editorial components

Component syntax and examples live in `docs/modernization/EDITORIAL-COMPONENTS.md`.

Use callouts sparingly for information that should interrupt the reading flow:

```liquid
{% raw %}{% capture safety_note %}
Support the vehicle with rated stands before working underneath it.
{% endcapture %}
{% include callout.html type="warning" title="Safety note" content=safety_note %}{% endraw %}
```

Available callout types include `note`, `warning`, `update`, `photo`, `podcast`, and `external`.

Product cards are for selective firsthand recommendations, not every merchant link. State why the item earned attention, how long or how often it was used, relevant limitations, and whether the exact model may have changed.

## Links, products, and affiliate disclosure

- Prefer the manufacturer's durable information for specifications.
- Link internally to the most relevant There4 article when it helps the reader continue the task.
- Check external destinations manually; do not replace a useful broken source with an unrelated home page.
- Amazon short links and tagged Amazon URLs receive `rel="sponsored"` during the build.
- Keep affiliate links clearly disclosed and editorially subordinate.
- Do not publish current prices; availability and pricing age quickly.
- Never imply firsthand use that did not happen.

Curated Gear records live in `_data/gear.yml`; related-article choices live in `_data/related.yml`; contextual archive notices live in `_data/archive_notes.yml`. Follow the existing structures and run the full verifier after changing any of them.

## Preview locally

The helper defaults to port 4001 so it does not collide with another local Jekyll process:

```sh
bin/serve
```

Choose another port when needed:

```sh
bin/serve 4010
```

Review at least:

- the new or updated article
- the homepage
- its topic archive
- its primary tag archive
- search results for its title and important terms
- a narrow phone viewport

Check heading order, image crops, captions, tables, callouts, code overflow, related items, merchant disclosure, and the Return to top link.

## Verify before committing

Run the complete production-equivalent gate:

```sh
bin/verify
```

It builds `public/` and checks durable URLs, internal links, metadata, structured data, headings, images, search, reading state, redirects, feed, sitemap, gear, calculators, and the archive inventory.

Do not refresh a verification baseline merely to make a failure disappear. Diagnose the result first. Baseline procedures are documented in `docs/modernization/VERIFICATION.md`.

Useful final checks:

```sh
git diff --check
git status --short
```

Commit the article, original images, WebP variants, and any intentionally changed data records. Do not commit `public/`, `.jekyll-cache/`, or local dependency directories.

## Deploy and verify production

DigitalOcean App Platform deploys `master` automatically. The production contract is documented in `docs/modernization/DEPLOYMENT.md`.

After merge:

1. Confirm the DigitalOcean build completed.
2. Open the canonical HTTPS article URL.
3. Check hero and inline images at desktop and phone widths.
4. Test important internal and merchant links.
5. Confirm the article appears in its archive and local search.
6. For a strategically important new or substantially updated page, use Search Console URL Inspection after deployment.

## Updating an existing article

Before editing, determine which kind of maintenance this is:

- **Correction:** fix the error without rewriting history.
- **Link maintenance:** preserve the original claim; add an archive/update note if availability changed.
- **Substantial revision:** add current findings, results, alternatives, and `lastmod`.
- **Replacement recommendation:** explain what changed instead of silently substituting a product.
- **Historical preservation:** leave dated details intact when they are part of the article's value.

Do not change the filename, permalink, topic, or old conclusions casually. Add a concise update callout when a modern reader needs context that did not exist at publication.

## Common failures

- **“Your Ruby version is …”** — activate Ruby 3.4.7 before running Bundler.
- **Port already in use** — run `bin/serve 4010` or another free port.
- **No `srcset` in generated HTML** — confirm variants sit beside the original and use exactly `.640.webp` and `.1280.webp` suffixes.
- **Missing image dimensions** — verify the source is a readable local JPEG, PNG, or GIF and that its path/case is correct.
- **Broken internal link** — use a root-relative canonical route with its trailing slash.
- **Unexpected affiliate failure** — confirm the link is a valid Amazon URL or explicitly mark the Gear destination as affiliate content.
- **Oversized rendered asset** — generate responsive variants or intentionally reduce the source export dimensions.

## Definition of done

An article is ready when it is useful without search traffic, honest about firsthand evidence and uncertainty, visually reviewed, accessible, locally searchable, fully verified, and still recognizable as Craig's writing.
