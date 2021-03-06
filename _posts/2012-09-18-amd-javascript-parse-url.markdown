---
layout:     post
title:      "AMD Javascript Parse URL"
subtitle:   "Using the DOM to parse a url with JavaScript"
tags:       [javascript]
author:     "Craig Davis"
header-img: "img/headers/vienna.jpg"
---

I recently had need to parse a url provided by an api. I looked at a resource such as
[uri.js](http://medialize.github.com/URI.js/) but this seemed quite heavy for my
[Backbone][bb] application.

Here's a slightly altered version of the much copied DOM approach to parsing a url.
This version has been edited for AMD [Require.js][require], and caches the anchor
element.

{% gist 3706510 parse_url.js %}

[bb]: http://backbonejs.org/
[require]: http://requirejs.org/
