---
layout:     post
title:      "Reading List: Summer Science Fiction Books"
subtitle:   "Take these to a sunny beach with you this summer"
date:       2016-07-10
tags:       [reading]
author:     "Craig Davis"
header-img: "img/headers/science-fiction.jpg"
books:
  - title: "2312"
    author: "Kim Stanley Robinson"
    year: 2013
    img: 2312.jpg
    amazon: http://amzn.to/29GmPHF
    caption: ""
    review: |
        Review
  - title: "Half Way Home"
    author: "Hugh Howey"
    year: 2013
    img: half-way-home.jpg
    amazon: http://amzn.to/29HUvlt
    caption: ""
    review: |
        Review
  - title: "Beacon 23"
    author: "Hugh Howey"
    year: 2016
    img: beacon-23.jpg
    amazon: http://amzn.to/29x9e2Q
    caption: ""
    review: |
        Review
  - title: "The Daedalus Incident"
    author: "Michael Martinez"
    year: 2013
    img: the-daedelus-incident.jpg
    amazon: http://amzn.to/29wkBuO
    caption: ""
    review: |
        Review
  - title: "The Origin Mystery (The Atlantis Gene)"
    author: "A. G. Riddle"
    year: 2013
    img: the-atlantis-gene.jpg
    amazon: http://amzn.to/29B7VjQ
    caption: ""
    review: |
        Review
  - title: "Pennsylvania"
    author: "Michael Bunker"
    year: 2014
    img: pennsylvania.jpg
    amazon: http://amzn.to/2a0eR8l
    caption: ""
    review: |
        Review
  - title: "The Plague Year"
    author: "Jeff Carlson"
    year: 2015
    img: plague-year.jpg
    amazon: http://amzn.to/29tmSAz
    caption: ""
    review: |
        Review
  - title: "Frozen Sky"
    author: "Jeff Carlson"
    year: 2012
    img: the-frozen-sky.jpg
    amazon: http://amzn.to/29wleo1
    caption: ""
    review: |
        Review
  - title: "Ship Breaker"
    author: "Paolo Bacigalupi"
    year: 2011
    img: ship-breaker.jpg
    amazon: http://amzn.to/29HVfGZ
    caption: ""
    review: |
        Review
  - title: "The Windup Girl"
    author: "Paolo Bacigalupi"
    year: 2015
    img: the-windup-girl.jpg
    amazon: http://amzn.to/29rfXsT
    caption: ""
    review: |
        Review

---

## Table of Contents

<ul>
{% for book in page.books %}
    <li><a href="#{{ book.title | slugify }}">{{ book.title }}</a></li>
{% endfor %}
</ul>
<hr>

I belive that science fiction is a tool to not just think about the future, but to also examine moral dilemas in our own time. These books are free to explore ethical blind spots and issues by creating their own worlds. Worlds that let us both stretch our imagination, and develop frameworks for understanding of society. Science fiction is an enormously powerful tool for examining our culture.

These are some of my favorite science fiction books that I've read over the last few years. I love talking about them enough, and have recommended them enough that I thought I'd finally take the time to collect them together into a single post. Here they are!

The links within this post are affiliate links to purchase these books. All of these are books that I've read, enjoyed, and have a place on my book shelf. None of these are what I'd consider hard science fiction, and I'd consider most of these to be solidly entertaining and fun reading. However, I feel that all of them have enough moments of thought-provoking introspection to be worthwhile, and to be considered proud members of the genre.

If you do read any of these, drop me a note and let me know if you enjoyed them! You can find me on Twitter at [@there4dev](https://twitter.com/There4Dev)

## Summer Science Fiction Reading

<div class="review">
{% if page.books %}
{% for book in page.books %}
    <div class="review-book" id="{{ book.title | slugify }}" >
        {% if book.img %}
        <figure>
            <a href="{{ book.amazon }}" title="Amazon: {{ book.title }}"><img src="/img/posts/summer-science-fiction/{{ book.img }}" alt="{{ book.title }}"></a>
            <figcaption>{{ book.caption }}</figcaption>
        </figure>
        {% endif %}
        <strong><a href="{{ book.amazon }}" title="Amazon: {{ book.title }}">{{ book.title }}</a></strong><br>
        <small>{{ book.author }}, {{ book.year }}</small><br>
        {% if book.review %}{{ book.review | markdownify }}{% endif %}
    </div>
    <hr style="clear: both; margin: 30px 0;">
{% endfor %}
{% else %}
    <p>The book list is empty!</p>
{% endif %}
</div>

Again, if you read any of these, <a href="https://twitter.com/There4Dev">please let me know</a>!

{% include disclosure.html %}
