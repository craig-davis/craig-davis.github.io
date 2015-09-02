---
layout:      post
title:       "OSX Media Keys for Filco Mechanical Keyboards"
subtitle:    "Using Karabiner to setup media control keys"
description: "Configuring media keys on a new mechanical keyboard"
date:        2015-09-03
tags:        []
author:      "Craig Davis"
header-img:  "img/headers/washington-road.jpg"
---

1. Download and install Karabiner
1. Go to `Misc & Uninstall` and choose `Open private.xml`
1. Edit `private.xml` with the sample below. This will map keys.
1. Go back to the main screen and click 'Reload XML'.
1. Select the key remapping


## Private XML

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
