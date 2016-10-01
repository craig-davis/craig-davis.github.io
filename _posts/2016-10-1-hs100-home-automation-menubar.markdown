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

## Implementation

In keeping with the theme of hacking this out - the project is a single file. It's simple, really simple.

### Network Scanning
The [discover][discover] method allows us to poll the IP addresses on our local network. We [query each ip](https://github.com/craig-davis/hs100-status-bar/blob/master/ac_control.py#L19) to see if it's an HS100 device, and if so, we [create a new menu item for it](https://github.com/craig-davis/hs100-status-bar/blob/master/ac_control.py#L34-L36). 

When you initial setup an HS100 device via the phone app, you give the device a name. This name is then available via the API. We use this name in the Rumps app. The devices also expose their current state of on/off, and we use that to set [the base state](https://github.com/craig-davis/hs100-status-bar/blob/master/ac_control.py#L35) of the Rumps toggle switch.

### API
We have a very simple [API Class](https://github.com/craig-davis/hs100-status-bar/blob/master/ac_control.py#L48) that exposes methods for `on`, `off`, `query`, and `meter`. I'm using the [less expensive HS100][amazon], and so the `meter` isn't available. However, if you had the [HS110 with the energy meter][hs110], this would be a great thing to wrap into this app. A pull request would be very welcome!

Rumps allows us to establish a callback for a toggle menu item, and we'll simply call our `on` or `off` method when we click on the item.

### Building the App
The project includes a simple [bash script](https://github.com/craig-davis/hs100-status-bar/blob/master/build.sh) that checks python requirements and then uses the [py2app][py2app] to build a standalone app. 

It also copies the icon into the application folder so that it is available to Rumps.

## Summary

This is a quick little app that has made a big difference in my office. It's quick and easy to use, and I've had a great time writing some Python again. If you try it out, please let me know by dropping me a note at [@there4dev][twitter].

[twitter]: https://twitter.com/There4Dev
[py2app]: https://pythonhosted.org/py2app/
[discover]: https://github.com/craig-davis/hs100-status-bar/blob/master/ac_control.py#L126
[reverse]: https://georgovassilis.blogspot.com/2016/05/controlling-tp-link-hs100-wi-fi-smart.html
[j05h]: https://github.com/j05h/hs100
[amazon]: http://amzn.to/2dzZsNu "Amazon affiliate link, please support this blog!"
[hs110]: http://amzn.to/2dFjHNF "Amazon affiliate link, please support this blog!"
[rumps]: https://github.com/jaredks/rumps
[rumps-examples]: https://github.com/jaredks/rumps/tree/master/examples
[github]: https://github.com/craig-davis/hs100-status-bar

{% include disclosure.html %}
