---
layout:     post
title:      "HS100 Home Automation Menu Bar App"
subtitle:   "Writing a home automation menu bar app with Python and Rumps"
date:       2016-10-01
tags:       ["python"]
author:     "Craig Davis"
header-img: "img/headers/beach-sunrise.jpg"
---

## The Finished Product
![hs100 app](https://raw.githubusercontent.com/craig-davis/hs100-status-bar/master/docs/screenshot.png)

The project is available at GitHub in my [hs100-status-bar][github] repository.

## Background
I have a very noise window unit air conditioner that I turn off during conference calls. This is a hassle if I want to screenshare for only a few moments. I've written a small menu bar app that lets me turn it on and off with a click. I wrote a command line client first, but I since I start my conference calls with a mouse, it was easier to use the menu bar app.

## TP-LINK HS100 Wi-Fi Smart Plug
The HS100 is a wifi enabled smart plug that works with a phone app and Amazon Echo. It allows you turn on an off an appliance at 120 volts and up to 15 amps. This is plenty for a small window air conditioning unit.

The HS100 doesn't have a open API for the device. However, George Georgovassilis has [done a wonderful job of documenting the commands][reverse] available to the device. This has opened up the devices to scripting from a variety of languages, and I've based my project on the work from [Josh Kleinpeter][j05h].

I purchased mine at Amazon. If you're interested in the project, here's an affiliate link for you to purchase the [HS100 at Amazon][amazon].

## Menu Bar Apps with Rumps
[Rumps][rumps] exposes Objective-C classes as Python classes and greatly simplifies the process of creating a statusbar application. It makes it very straight forward to create a little app that lists the available devices on the network and gives a toggle to turn them on and off.

Rumps is no longer under active development. However, it's stable, easy to use, and has a small footprint. It's got [everything we need][rumps-examples] for this little task.

[reverse]: https://georgovassilis.blogspot.com/2016/05/controlling-tp-link-hs100-wi-fi-smart.html
[j05h]: https://github.com/j05h/hs100
[amazon]: http://amzn.to/2dzZsNu
[rumps]: https://github.com/jaredks/rumps
[rumps-examples]: https://github.com/jaredks/rumps/tree/master/examples
[github]: https://github.com/craig-davis/hs100-status-bar

{% include disclosure.html %}
