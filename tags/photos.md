---
layout:     post
title:      "Photos"
subtitle:   "Me and my Nikon."
header-img: "img/headers/washington-road.jpg"
tag: photos
permalink: /tags/photos/
---
<div>
    {% if site.tags[page.tag] %}
        <ul>
        {% for post in site.tags[page.tag] %}
        <li><a href="{{ post.photourl }}/">{{ post.title }}</a></li>
        {% endfor %}
        </ul>
    {% else %}
        <p>There are no posts for this tag.</p>
    {% endif %}
</div>
