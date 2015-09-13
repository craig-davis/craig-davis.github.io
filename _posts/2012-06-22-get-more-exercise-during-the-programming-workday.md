---
layout:     post
title:      "Get more exercise during the programming workday"
subtitle:   "If sitting kills, surely this will help"
tags:       []
author:     "Craig Davis"
header-img: "img/headers/tent-rocks.jpg"
---

After years of sitting and programming, I've started using a stand-up desk.
And now, I've added one more habit to stay a little more mobile during the
workday.

I've added a global [Mercurial][hg] [commit hook][hook] that suggests exercise every time I make
a mercurial commit. Here's the code:

{% gist 2972827 exercise.sh %}

I added it to my global .hgrc file as a hook, and now I get a recommendation
for an exercise eat time I commit.

If you've got space (or if you're in a home office), you can add a few basic supplies that will offer you some additional options:

* [TheraBand Latex-Free Resistance Bands](http://amzn.to/1VVYeMd) - tie these to something solid and do [some rotator cuff exercises](https://www.youtube.com/watch?v=esmEnVa8Mbk).
* [Foam Roller](http://amzn.to/1OnUiBJ) to work on your [upper back posture](www.youtube.com/watch?v=Mh_YxQB2E7E)

[hg]: https://mercurial.selenic.com/
[hook]: http://hgbook.red-bean.com/read/handling-repository-events-with-hooks.html
