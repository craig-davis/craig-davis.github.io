---
layout:     post
title:      "PHP Pake to build a README file"
subtitle:   "Add command line help output to a README"
date:       2012-09-27 15:51
tags:       [php, pake]
author:     "Craig Davis"
header-img: "img/headers/deck.jpg"
---

I've been putting together the new [FogBugz Client](http://there4.github.com/fogbugz-php-cli/)
and wanted a nice way to build the [README.md](https://github.com/there4/fogbugz-php-cli/blob/master/README.md)
file without having to use templates for the file content.

This is a small [Pake](https://github.com/indeyets/pake/wiki) command to build
the README. It trims out everything from the Help heading to the following
heading, and places the output of the command in it's place. It's hackish, but
it keeps the readme up to date.

{% gist 3796563 readme_pakefile.php %}
