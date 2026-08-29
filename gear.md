---
layout: page
title: Gear
subtitle: Tools, parts, and equipment that earned their place through firsthand use.
description: Field-tested shop, machine, outdoor, and computing gear used and documented by Craig Davis.
header-img: img/headers/tool-chart.jpg
permalink: /gear/
schema_type: collection
---

<div class="gear-intro">
  <p>This is a curated index of equipment I have personally used and written about. It is not a complete catalog, a price tracker, or a list assembled from product specifications. The “documented since” date tells you when the linked field notes established that experience; it does not promise that a model is still manufactured or unchanged.</p>
  {% include disclosure.html %}
</div>

<nav class="gear-categories" aria-label="Gear categories">
{% for category_pair in site.data.gear.categories %}
  <a href="#{{ category_pair[0] }}">{{ category_pair[1].name }}</a>
{% endfor %}
</nav>

{% for category_pair in site.data.gear.categories %}
  {% assign category_id = category_pair[0] %}
  {% assign category = category_pair[1] %}
  <section class="gear-section" id="{{ category_id }}" aria-labelledby="{{ category_id }}-title">
    <div class="section-heading">
      <div><p class="eyebrow">Field-tested</p><h2 id="{{ category_id }}-title">{{ category.name }}</h2></div>
    </div>
    <p class="gear-section__description">{{ category.description }}</p>
    <div class="gear-grid">
      {% for gear in site.data.gear.items %}{% if gear.category == category_id %}{% include gear-card.html gear=gear %}{% endif %}{% endfor %}
    </div>
  </section>
{% endfor %}
