---
layout:     post
title:      "Dotfiles for Puppet Installation"
sustitle:   "Take your bash preferences with you!"
tags:       []
author:     "Craig Davis"
header-img: "img/headers/northfork.jpg"
---

I take my dotfiles with me everywhere I go. With this file in my [Vagrant][vagrant]
setup with [Puppet][puppet], I'm able to login and feel right at home.

The basis for my dotfiles is the excellent set from [Mathias][mb].

{% gist 3626841 package_dev_tools.pp %}

[vagrant]: http://vagrantup.com/
[puppet]: http://vagrantup.com/v1/docs/provisioners/puppet.html
[mb]: https://github.com/mathiasbynens/dotfiles
