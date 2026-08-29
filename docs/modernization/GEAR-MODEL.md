# There4 Gear Data Model

`_data/gear.yml` is the source of truth for curated Gear pages and article references. It is intentionally separate from the hundreds of historical commerce links embedded in prose.

## Inclusion standard

An item belongs in Gear only when an existing There4 article establishes firsthand use. Each record must explain the use case, link to that evidence, and state when the experience was documented. Specifications, popularity, and affiliate availability are not sufficient reasons for inclusion.

“Documented since” is deliberately conservative. It identifies the earliest supporting field note; it does not claim uninterrupted ownership, current availability, or that a manufacturer has left the model unchanged.

## Record shape

```yaml
- id: stable-slug
  name: Product name
  maker: Optional manufacturer
  category: shop
  image: /img/posts/example/product.jpg
  image_alt: Useful description
  summary: What the item is useful for
  experience: The firsthand evidence supporting its place
  documented_since: 2020
  recommendation: Long-term pick
  article: /2020/01/01/supporting-field-notes/
  destinations:
    - label: Manufacturer
      url: https://manufacturer.example/product
      affiliate: false
    - label: Amazon
      url: https://amzn.to/example
      affiliate: true
```

## Merchant neutrality

- Product identity and editorial experience do not belong to a merchant.
- A record can have zero, one, or several purchase destinations.
- Every destination explicitly declares whether it is affiliated.
- Prices are prohibited because they become stale and make the site resemble a storefront.
- The internal field-note link is presented before merchant destinations.
- Original full-size articles retain their historical links and context.

## Categories

The initial categories are Shop, Bikes & Outdoors, Machines, and Computing. Categories describe how Craig uses an item, not how a retailer organizes inventory.

## Validation

`scripts/verify_gear.rb` validates required fields, unique IDs, categories, local images, supporting article URLs, destination URLs, explicit affiliate flags, rendered cards, and article-to-Gear references. It runs as part of `bin/verify` and CI.
