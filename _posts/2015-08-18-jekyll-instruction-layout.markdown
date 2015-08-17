---
layout:      post
title:       "Jekyll Layout for Tutorial Pages"
subtitle:    "Using Liquid and front matter to make an tutorial page"
description: "Make a Jekyll blog post with a simple tutorial format"
date:        2015-08-18
tags:        [ux]
author:      "Craig Davis"
header-img:  "img/headers/lake-sammish.jpg"
---

Liquid is uniquely perfect for making an Instructable style page without writing html. In this blog post, I'll show you how to add content to a front matter array and have a nicely formatted tutorial page generated.

### 1. Create a new layout for the tutorial page

Create `_layouts/tutorial.html` in your [Jekyll](http://jekyllrb.com/) site. We will pull our tutorial items from an array on the `_posts` file. The array will be located in the front matter, and so the `steps` array is available to the layout as `page.steps`. Each tutorial step has several items:

1. Image
1. Image caption
1. Image link to fullsize
1. Instructions

This is going to use a new array placed into the front matter of a post to display each step in the tutorial. This means that instead of writing html, you can just make an array of steps!

{% highlight liquid %}
{% raw %}
---
layout: post
---

{{ content }}

<div class="tutorial">
{% if page.steps %}
{% for step in page.steps %}
    <h3>{{ forloop.index }}. {{ step.title }}</h3>
    <div class="tutorial-step">
    {% if step.img %}
        <figure>
            {% if step.imglink %}<a href="{{ step.imglink }}">{% endif %}<img src="{{ step.img }}" alt="Step {{ forloop.index }}">{% if step.imglink %}</a>{% endif %}
            {% if step.caption %}<figcaption>{{ step.caption }}</figcaption>{% endif %}
        </figure>
    {% endif %}
    {% if step.instruction %}<p>{{ step.instruction | markdownify }}</p>{% endif %}
  </div>
{% endfor %}
{% else %}
    <p>This tutorial has no steps!</p>
{% endif %}
</div>

<p style="clear: both">{% if page.summary %}{{ page.summary }}{% endif %}</p>
{% endraw %}
{% endhighlight %}

### 2. Use this layout in a new post

Update the front matter of a post to use this new template:
{% highlight liquid %}
{% raw %}
---
layout: tutorial
---
{% endraw %}
{% endhighlight %}

### 3. Add the new tutorial to the front matter

You can see [a full example in my Miter Saw post](https://raw.githubusercontent.com/craig-davis/craig-davis.github.io/master/_posts/2015-08-17-miter-saw-workbench.markdown). Note that in the second array element, the `>` operator allows us to make a multi-line assignment.

{% highlight liquid %}
{% raw %}
steps:
  - title: Measure the ingredients
    img: /img/posts/IMG_0145.jpg
    imglink: /img/posts/IMG_0145-fullsize.jpg
    caption: Basic kitchen measuring tools
    instruction: Measure the ingredients to cook mise-en-place.
  - title: Marinate the chicken
    img: /img/posts/IMG_0141.jpg
    instruction: >
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
{% endraw %}
{% endhighlight %}

### 4. Add some new styles to format the tutorial

*Please note that there is an extra space in the media rule because of a bug in jekyll-mentions*.

{% highlight css %}

.tutorial h3 {
  clear: both;
}
.tutorial-step figure {
    width: 50%;
}
@ media (max-width: 767px) {
  .tutorial-step figure {
    width: 100%;
  }
}

figure {
  float: left;
  margin: 0 1rem 1rem 0;
}
figure img {
  margin-bottom: 1rem;
  text-align: center;
}
figure figcaption {
  font-style: italic;
  font-size: 80%;
  text-align: center;
}

{% endhighlight %}

### 5. Publish some tutorials!

Go forth and publish tutorials.

