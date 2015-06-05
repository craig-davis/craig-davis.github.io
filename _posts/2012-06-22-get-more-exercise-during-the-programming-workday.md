---
layout:     post
title:      "Get more exercise during the programming workday"
subtitle:   "If sitting kills, surely this will help"
tags:       [hg, habits]
author:     "Craig Davis"
header-img: "img/headers/tent-rocks.jpg"
---

After years of sitting and programming, I've started using a stand-up desk.
And now, I've added one more habit to stay a little more mobile during the
workday.

I've added a global [commit hook][hook] that suggests exercise every time I make
a mercurial commit. Here's the code:

{% gist 2972827 exercise.sh %}

I added it to my global .hgrc file as a hook, and now I get a recommendation
for an exercise eat time I commit.

[hook]: http://hgbook.red-bean.com/read/handling-repository-events-with-hooks.html
