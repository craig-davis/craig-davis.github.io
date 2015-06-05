---
layout:     post
title:      "jQuery Animated Border: jquery.animatedborders.js"
subtitle:   "Draw attention to an element with a lightweight effect"
date:       2013-01-03 18:11
tags:       [jQuery,javascript,plugins,ui]
author:     "Craig Davis"
header-img: "img/headers/laptop.jpg"
---
<style>
.alpha { clear: both; }
.alpha, .bravo, .charlie, .delta {
    width: 104px;
    height: 100px;
    float: left;
    border: 1px solid black;
    margin: 5px;
    padding: 5px;
    background: #ffffff;
    font-size: 10px;
    font-family: Helvetica, sans-serif;
}
</style>

Animated borders for any block level element. This plugin creates an animated
border with configurable thickness and color.

## Examples

<div class="examples clearfix" style="margin: 0 1em 1em;">
  <div class="alpha">Single Pixel</div>
  <div class="bravo"><a href="#">Toggle Highlight</a></div>
  <div class="charlie">Fat Border</div>
  <div class="delta">Hover Triggered</div>
</div>

## Download

* <a href="https://github.com/there4/jquery-animatedborder/zipball/master">jquery.animatedborder.zip</a> <small>Master</small>
* <a href="https://github.com/there4/jquery-animatedborder/blob/master/css/stripe.gif">stripe.gif</a> <small>transparent white, 4x4 check</small>

## Instructions

The animated border method toggles animated borders on an element. To apply
animated borders to an elements:

{% highlight javascript %}
$('div.alpha').animatedBorder({size : 1, color : 'red'});
{% endhighlight %}

Apply it again to remove the borders:

{% highlight javascript %}
$('div.alpha').animatedBorder();
{% endhighlight %}

The plugin accepts a configuration object. You can specify a background color,
and the size of the border.
{% highlight javascript %}
options = {
    size: 2,
    color: '#6699CC'
}
{% endhighlight %}

## Known Issues

* __Background patterns__ are not handled with the default stripe.gif file.
  The plugin uses the the background color of the divs to make the border color.
  This means that the non-transparent area of the checkerboard has to match the background color of the
  page for the illusion to work. If you had a page with surrounding elements under the border, or you had
  a non white background, you should create a new animated gif with blocks that are transparent and the
  desired border color.



[gh]: https://github.com/there4/jquery-animatedborder
