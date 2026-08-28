# There4 Editorial Components

Phase 3 establishes one article frame for standard posts, book guides, instructions, photo essays, podcasts, and externally published entries. These interfaces are intentionally small so archive migration can remain incremental.

## Article front matter

The shared article header recognizes:

```yaml
title: Required article title
subtitle: Existing deck or summary
deck: Optional preferred replacement for subtitle
description: Search and social description
topic: Optional primary display topic
date: 2026-08-28
last_modified_at: 2026-09-01
author: Craig Davis
header-img: img/headers/example.jpg
tags: [jeep, tools]
```

`deck` takes precedence over `subtitle`. `topic` takes precedence over the first tag in the visual eyebrow. Existing fields remain supported.

## Table of contents

Long articles can opt into a curated table of contents. IDs must match explicit or Markdown-generated heading IDs.

```yaml
toc:
  - title: The problem
    id: the-problem
  - title: The solution
    id: the-solution
```

Curated entries are preferred to an automatic list because they allow useful labels and omit minor sections.

## Callouts

Capture longer Markdown before passing it to the include:

```liquid
{% raw %}{% capture note %}The useful note text, with **Markdown**.{% endcapture %}
{% include callout.html type="note" title="Note" content=note %}{% endraw %}
```

Supported initial types are `note`, `warning`, `update`, `photo`, `podcast`, and `external`. Types share semantics while allowing restrained visual variation.

## Product cards

```liquid
{% raw %}{% include product.html
  label="Craig's pick"
  title="Product name"
  description="Why it earned a place in the article."
  image="/img/posts/example/product.jpg"
  image_alt="Product name on a workbench"
  url="https://example.com"
  link_text="View product"
%}{% endraw %}
```

Use a nearby affiliate disclosure when the destination is monetized. Product cards should express firsthand editorial judgment, not function as generic advertisements.

## Figures

```liquid
{% raw %}{% include figure.html
  src="/img/posts/example/detail.jpg"
  alt="Specific description of the useful visual information"
  caption="Optional context"
  width="1600"
  height="1067"
  max-width="46rem"
%}{% endraw %}
```

New and migrated figures should include intrinsic dimensions. Archive-wide image metadata remains Phase 5 work.

## Related writing

The shared frame displays up to three other posts with the article's first tag. The relationship is deterministic and requires no client JavaScript. Phase 4 taxonomy work will improve the underlying topic assignments.

## External entry layouts

`photo`, `podcast`, and `remote` now render complete local article pages with clear calls to the original destination. This preserves local URLs and gives readers context when an external service changes or disappears.
