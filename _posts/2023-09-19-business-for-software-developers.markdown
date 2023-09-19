---
layout:     post
title:      "Business and Growth for Software Developers"
subtitle:   "Modern software development business practices and growth mindset"
date:       2023-09-19
tags:       [reading]
author:     "Craig Davis"
header-img: "img/headers/software-books.jpg"

books:
  - title: "The First 90 Days"
    author: Michael D. Watkins
    year: 2013
    img: 90-days.jpg
    amazon: https://amzn.to/3LtgZIy
    caption: Proven Strategies for Getting Up to Speed Faster and Smarter, Updated and Expanded
    review:
  - title: "The Personal MBA"
    author: Josh Kaufman
    year: 2012
    img: personal-mba.jpg
    amazon: https://amzn.to/48lkWJa
    caption: Master the Art of Business
    review:
  - title: "Now, Discover Your Strengths"
    author: Marcus Buckingham and Donald O. Clifton
    year: 2020
    img: discover-strengths.jpg
    amazon: https://amzn.to/3t0ky2G
    caption: The revolutionary Gallup program that shows you how to develop your unique talents and strengths
    review:
  - title: "Search Inside Yourself"
    author:  Chade-Meng Tan, Daniel Goleman, Jon Kabat-Zinn (Author)
    year: 2014
    img: search-inside-yourself.jpg
    amazon: https://amzn.to/3PKRc1d
    caption: The Unexpected Path to Achieving Success, Happiness (and World Peace)
    review:
  - title: "Radical Candor"
    author: Kim Scott 
    year: 2019
    img: radical-candor.jpg
    amazon: https://amzn.to/3ZlTyGY
    caption: Be a Kick-Ass Boss Without Losing Your Humanity
    review:
  - title: "Getting Things Done"
    author: David Allen
    year: 2015
    img: getting-things-done.jpg
    amazon: https://amzn.to/45Uq05R
    caption: The Art of Stress-Free Productivity
    review:
  - title: "The Progress Principle"
    author: Teresa Amabile, Steven Kramer
    year: 2011
    img: progress-principle.jpg
    amazon: https://amzn.to/3Rt0ccu
    caption: Using Small Wins to Ignite Joy, Engagement, and Creativity at Work
    review:
  - title: "The Manager's Path"
    author: Camille Fournier
    year: 2017
    img: managers-path.jpg
    amazon: https://amzn.to/45Yf4UB
    caption: A Guide for Tech Leaders Navigating Growth and Change
    review:
  - title: "Leaders Eat Last"
    author: Simon Sinek
    year: 2017
    img: leaders-eat-last.jpg
    amazon: https://amzn.to/3Zo41Bz
    caption: Why Some Teams Pull Together and Others Don't
    review:
  - title: "Drive"
    author: Daniel H. Pink
    year: 2011
    img: drive.jpg
    amazon: https://amzn.to/3EJ1ubB
    caption: The Surprising Truth About What Motivates Us
    review:
  - title: "Deep Work"
    author: Cal Newport
    year: 2013
    img: deep-work.jpg
    amazon: https://amzn.to/3EH5fyu
    caption: Rules for Focused Success in a Distracted World
    review:
  - title: "Flow"
    author: Mihaly Csikszentmihalyi 
    year: 2008
    img: flow.jpg
    amazon: https://amzn.to/3Lu3SqO
    caption: The Psychology of Optimal Experience
    review:
  - title: "Accelerate This!"
    author: Ryan Kushner, Danny Kennedy
    year: 2018
    img: accelerate-this.jpg
    amazon: https://amzn.to/3PJtcv7
    caption: A Super Not Boring Guide To Startup Accelerators And Clean Energy Entrepreneurship
    review:
---

## Business Education for Developers

Technical skills are the backbone of software development. However, in today's world of startups, understanding the broader business landscape is equally vital. A strong grasp of business concepts, such as project management, budgeting, and market analysis, can transform you into a more versatile and effective professional. Having this background enables you to bridge the gap between technical initiatives and business objectives. 

Business vocabulary and viewpoints can help you have smoother communication with non-technical stakeholders. Moreover, a business-oriented perspective can help you make strategic decisions, align software projects with organizational goals, and even explore entrepreneurial opportunities.

With this in mind, I'm sharing a collection of books that I've accumulated over the years. Each of these books was recommended to me by managers and members of leadership at my previous and current employers - there are no sponsorships here.

## Table of Contents
<ul>
{% for book in page.books %}
    <li><a href="#{{ book.title | slugify }}">{{ book.title }}</a></li>
{% endfor %}
</ul>
<hr>

<small>The links below are Amazon affiliate links. Purchasing any of these books help fund more posts like these.</small>

<div class="review">
{% if page.books %}
{% for book in page.books %}
    <div class="review-book" id="{{ book.title | slugify }}" >
        {% if book.img %}
        <figure>
            <a href="{{ book.amazon }}" title="Amazon: {{ book.title }}"><img src="/img/posts/software-engineering/{{ book.img }}" alt="{{ book.title }}"></a>
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

{% include disclosure.html %}

