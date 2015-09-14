---
layout:      post
title:       "Maintaining and Using Your Bash History"
subtitle:    "Tips and tricks for using your bash history more productively"
description: "Tips and tricks for using your bash history more productively"
date:        2015-09-14
tags:        []
author:      "Craig Davis"
header-img:  "img/headers/sunrise.jpg"
---

## Search Bash History
{% highlight bash %}
history | grep ssh
{% endhighlight %}

To see the most recent commands:

{% highlight bash %}
history 7
{% endhighlight %}

## Executing Commands from Bash History

Record 89 in your history
{% highlight bash %}
!89
{% endhighlight %}

Two commands ago

{% highlight bash %}
!-2
{% endhighlight %}

Rerun the previous command
{% highlight bash %}
!!
{% endhighlight %}

Rerun the previous command as sudo
{% highlight bash %}
sudo !!
{% endhighlight %}

Run the previous command and make a substitution
{% highlight bash %}
!!:s/WORD1/WORD2
{% endhighlight %}

## Update your record keeping

Open your `~/.bashrc` file and change or add these settings:

{% highlight bash %}
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
alias h="history"
{% endhighlight %}

This will keep the last 5000 commands in memory, and the last 10000 lines on disk. It will also append to the Bash history file instead of overwriting it.
The new `h` alias means we can just type `h | grep ssh` intead of using the entire command.

## Make searching more intuitive

History searching with arrow keys

{% highlight bash %}
"\e[B": history-search-forward
"\e[A": history-search-backward
{% endhighlight %}

## Shortcut for grepping

Grep for a word or phrase and remove previous instances of searching

{% highlight bash %}
alias h="history | grep -E -v '^ *[0-9]+ *h ' | grep "
{% endhighlight %}

## Use an additional tool

[https://github.com/dvorka/hstr](https://github.com/dvorka/hstr)

## Perhaps a way to keep EVERYTHING

{% highlight bash %}
HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"
{% endhighlight %}
