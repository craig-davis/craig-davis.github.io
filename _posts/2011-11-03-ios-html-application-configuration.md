---
layout: post
title: "iOS HTML Application Configuration"
description: "The Apple-specific meta tags and startup images used to configure a home-screen web application on early versions of iOS."
tags: [ux]
topic: software
author:     "Craig Davis"
header-img: "img/headers/hanging-rock.jpg"
---

The following settings will make a website added to the iOS homepage look and
act nearly identical to a proper application. This will set the viewport to
disallow scaling, so we must be careful to implement an adaptive viewport
strategy ourselves.

In addition, this sets paths for all of the Apple icons used for startup
and application icons.

{% include snippets/mobile-meta-links.html %}
