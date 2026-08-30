---
layout: page
title: Outdoors
subtitle: "Bikes, trails, travel, snow, and the practical details that make time outside better."
permalink: /topics/outdoors/
schema_type: collection
---

<section class="listing-section" aria-labelledby="outdoors-latest-title">
  <div class="section-heading">
    <h2 id="outdoors-latest-title">Latest outdoors</h2>
    <a href="{{ '/posts/' | relative_url }}">Complete archive</a>
  </div>
  <div class="post-card-grid">
    {% for post in site.posts %}
      {% if post.tags contains 'bike' or post.tags contains 'photos' or post.tags contains 'motorcycles' %}
        {% include post-card.html post=post %}
      {% endif %}
    {% endfor %}
  </div>
</section>
