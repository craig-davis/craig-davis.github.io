---
layout:      post
title:       "OSX Media Keys for Filco Mechanical Keyboards"
subtitle:    "Using Karabiner to setup media control keys"
description: "Configuring media keys on a new mechanical keyboard"
date:        2015-09-03
tags:        []
author:      "Craig Davis"
header-img:  "img/headers/filco-keyboard.jpg"
---

I really enjoy my [Filco mechanical keyboard](http://amzn.to/1nXfUuA), and highly recommend one to anyone with a desk. However, moving from an Apple keyboard can take a little getting used to. In particular, you may miss your dedicated media keys.

I've remapped my keyboard with media controls, and I've added them out of the way so that I can keep my function keys in their primary mode for hotkey use.

I've chosen to map:

* Page Up: Volume Up
* Page Down: Volume Down
* End: Mute
* Print Screen (F13): Previous track
* Scroll Lock (F14): Play/Pause
* Break (F15): Next track

### 1. Install Karabiner
Download and install [Karabiner](https://pqrs.org/osx/karabiner/). This is an excellent keyboard utility for OSX that allows you to truly customize your keyboard. Open the application.

### 2. Edit the Config File
Go to `Misc & Uninstall` and choose `Open private.xml`:

![Open XML config file](/img/posts/osx-media-keys/open-private-xml.png)

Use your editor of choice to update `private.xml` with the sample below:

{% highlight xml %}
<?xml version="1.0"?>
<root>
  <item>
    <name>Change Page Up to Volume Up</name>
    <identifier>private.pageup_command_to_volume_up</identifier>
    <autogen>__KeyToKey__ KeyCode::PAGEUP, ConsumerKeyCode::VOLUME_UP</autogen>
  </item>
  <item>
    <name>Change Page Down to Volume Down</name>
    <identifier>private.pagedown_command_to_volume_down</identifier>
    <autogen>__KeyToKey__ KeyCode::PAGEDOWN, ConsumerKeyCode::VOLUME_DOWN</autogen>
  </item>
  <item>
    <name>Change End to Volume Mute</name>
    <identifier>private.end_command_to_volume_mute</identifier>
    <autogen>__KeyToKey__ KeyCode::END, ConsumerKeyCode::VOLUME_MUTE</autogen>
  </item>
  <item>
    <name>Change F13 to Music Previous</name>
    <identifier>private.f13_command_to_music_previous</identifier>
    <autogen>__KeyToKey__ KeyCode::F13, ConsumerKeyCode::MUSIC_PREV</autogen>
  </item>
  <item>
    <name>Change F14 to Music Play/Pause</name>
    <identifier>private.scolllock_command_to_music_play</identifier>
    <autogen>__KeyToKey__ KeyCode::F14, ConsumerKeyCode::MUSIC_PLAY</autogen>
  </item>
  <item>
    <name>Change F15 to Music Next</name>
    <identifier>private.f15_command_to_music_next</identifier>
    <autogen>__KeyToKey__ KeyCode::F15, ConsumerKeyCode::MUSIC_NEXT</autogen>
  </item>
</root>
{% endhighlight %}

### 3. Reload the Config

Go back to the main screen and click 'Reload XML'.

![](/img/posts/osx-media-keys/reload-xml.png)

### 4. Select the Key Remapping
![](/img/posts/osx-media-keys/selected-remapping.png)

### 5. Play Music

With this configuration, the Page Up/Down become volume. The End button becomes mute, and the top right three buttons become Previous, Play/Pause, and Next.

You can easily choose other mappings, and it's pretty straightforward if you use [the reference file of key codes](https://github.com/tekezo/Karabiner/blob/version_10.8.0/src/bridge/generator/keycode/data/KeyCode.data) that is available.
