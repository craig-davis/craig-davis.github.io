---
layout: page
title: Search
subtitle: Find a field note by subject, tool, machine, or idea.
description: Search the There4 archive of software, machines, making, bikes, books, and life.
permalink: /search/
header-img: img/headers/compass.png
header-alt: A compass face representing navigation through the There4 archive
search_page: true
schema_type: collection
---

<article class="search" data-search-root data-index-url="{{ '/search-index.json' | relative_url }}">
  <form class="search-form" role="search" data-search-form>
    <label for="archive-search">Search the archive</label>
    <div class="search-form__controls">
      <input id="archive-search" name="q" type="search" autocomplete="off" spellcheck="false" aria-describedby="search-help" placeholder="Try Jeep XJ, woodworking, or JavaScript" data-search-input>
      <button type="submit">Search</button>
    </div>
    <p class="search-form__help" id="search-help">Searches titles, descriptions, topics, and tags. Everything stays in your browser.</p>
  </form>

  <div class="search-results" aria-labelledby="search-results-title">
    <div class="section-heading">
      <h2 id="search-results-title">Results</h2>
      <p class="search-results__status" role="status" aria-live="polite" data-search-status>Enter a search above.</p>
    </div>
    <ol class="search-results__list" data-search-results></ol>
    <noscript><p>Search needs JavaScript, but the complete <a href="{{ '/posts/' | relative_url }}">writing archive</a> remains available by topic, tag, and date.</p></noscript>
  </div>
</article>
