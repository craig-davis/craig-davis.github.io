---
layout:     post
title:      "Reading List: Single Topic History Books"
subtitle:   "History through the lens of a single subject"
date:       2016-04-03
tags:       [reading]
author:     "Craig Davis"
header-img: "img/headers/old-truck.jpg"
books:
  - title: "Salt: A World History"
    author: Mark Kurlansky
    year: 2003
    img: salt.jpg
    amazon: http://amzn.to/25ETTD6
    caption: It's provoked wars, been used as money, and been the basis of empires
    review: |
        This is the first of this genre that I read. Salt is so common, and so overlooked, that we rarely consider its place in history. In this book, Kurlansky looks at salt as not just a culinary necessity, but as the driver of an economic engine that has shaped society. In particular, the preservation of food has been an important part of human achievement - from early exploration to living in extreme climates. This has made salt incredibly valuable, and as such, we can use the topic of salt to examine early traveling and the development of trade routes. The book is a bit meandering and leaves some of the logical conclusions up to the reader. However, overall the historical detail, fascinating anecdotes, and quality storytelling make this a great introduction to the genre.
  - title: "Gold: The Race for the World's Most Seductive Metal"
    author: Matthew Hart
    year: 2014
    img: gold.jpg
    amazon: http://amzn.to/1TtZ97L
    caption: A love affair - from jewelry to industrial and computer application.
    review: |
        Review
  - title: "Coal: A Human History "
    author: Barbara Freese
    year: 2004
    img: coal.jpg
    amazon: http://amzn.to/1RVNpM5
    caption: From Romans to modern power plants - the story of coal.
    review: |
        Review
  - title: "Diamond: A Journey to the Heart of an Obsession"
    author: Matthew Hart
    year: 2002
    img: diamond.jpg
    amazon: http://amzn.to/1RVNHmb
    caption: Wealth, prestige and love? Or war, mostly lies and war.
    review: |
        Review
  - title: "Mauve: How One Man Invented a Color That Changed the World"
    author: Simon Garfield
    year: 2002
    img: mauve.jpg
    amazon: http://amzn.to/1RVPrvE
    caption: Chemistry, history, art - The discovery of the first synthetic dye
    review: |
        Review
  - title: "Birdseye: The Adventures of a Curious Man"
    author: Mark Kurlansky
    year: 2013
    img: birdseye.jpg
    amazon: http://amzn.to/1UNW0kM
    caption: How a fur trapper in Canada brought us all frozen food
    review: |
        Review
  - title: "Cod: A Biography of the Fish that Changed the World"
    author: Mark Kurlansky
    year: 2010
    img: cod.jpg
    amazon: http://amzn.to/25EU7tO
    caption: World history, as told by the importance of cod fish
    review: |
        Review
  - title: "Tomatoland: How Modern Industrial Agriculture Destroyed Our Most Alluring Fruit "
    author: Barry Estabrook
    year: 2012
    img: tomatoland.jpg
    amazon: http://amzn.to/25EUowU
    caption: An examination of modern agribusiness and environmental issues
    review: |
        Review
  - title: "Banana: The Fate of the Fruit That Changed the World"
    author: Dan Koeppel
    year: 2008
    img: banana.jpg
    amazon: http://amzn.to/1osXMZP
    caption: There's a chance the garden of eden apple was actually a banana.
    review: |
        Review
  - title: "Extra Virginity: The Sublime and Scandalous World of Olive Oil"
    author: Tom Mueller
    year: 2013
    img: olive-oil.jpg
    amazon: http://amzn.to/1RVOovQ
    caption: Medicine, beauty aid, cooking oil, religious sacrament.
    review: |
        Review
  - title: "Spice: The History of a Temptation"
    author: Jack Turner
    year: 2005
    img: spice.jpg
    amazon: http://amzn.to/1RGYqvf
    caption: A history of the world through the development of the spice trade
    review: |
        Review
  - title: "A History of the World in 6 Glasses"
    author: Tom Standage
    year: 2006
    img: glasses.jpg
    amazon: http://amzn.to/1Tu0iw5
    caption: Beverages that have had an impact on history
    review: |
        Review
  - title: "Cotton: The Biography of a Revolutionary Fiber"
    author: Stephen Yafa
    year: 2006
    img: cotton.jpg
    amazon: http://amzn.to/1RGYZFt
    caption: An important part of the industrial revolution, and the civil war.
    review: |
        Review


---
[petroski]: http://amzn.to/25ETsbL "Amazon: Henry Petroski"
[salt]: http://amzn.to/1RGV8rZ "Amazon: Salt, A World History"

I stumbled into a genre of [microhistory](https://en.wikipedia.org/wiki/Microhistory) books that trace the history a particular topic. Each of these books explores history through the lens of a single subject. It's an interesting exercise in the influence of a material or resource through time. I've enjoyed seeing how our modern society has been shaped by things that we may take for granted. None of these are as technical as a [Petroski book][petroski],

For instance, the word "salary" comes from the Latin word for [salt][salt]. It was so valuable that some Roman Legions were paid in salt, and it was in fact more valuable than gold at the time. The incredible need for salt and the trade routes that this established had far reaching effects that last to this day. By looking at the history of salt, we can examine a cross section of history, putting each time period into perspective. For instance, with salt we can trace the history of the industrial revolution as we develop new ways to mine, as well as international shipping and taxation. These books are fascinating in that they turn away from a generalist approach to history, and instead allow us to look at everything involving a single topic.

The links within this post are affiliate links to purchase these books. All of these are books that I've read, enjoyed, and have a place on my book shelf. I'd consider most of these "beach reading" - none are particular technical, and all of them have enough moment of "huh, that's interesting" to make them good pop-culture touchstones.

If you do read any of these, drop me a note and let me know if you enjoyed them! You can find me on Twitter at [@there4dev](https://twitter.com/There4Dev)

## Table of Contents
<ul>
{% for book in page.books %}
    <li><a href="#{{ book.title | slugify }}">{{ book.title }}</a></li>
{% endfor %}
</ul>
<hr>

## Single Topic History Books

<div class="review">
{% if page.books %}
{% for book in page.books %}
    <div class="review-book" id="{{ book.title | slugify }}" >
        {% if book.img %}
        <figure>
            <a href="{{ book.amazon }}" title="Amazon: {{ book.title }}"><img src="/img/posts/single-topic-history/{{ book.img }}" alt="{{ book.title }}"></a>
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
