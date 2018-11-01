---
layout:     instructable
title:      "Jeep XJ Illuminated Extended Idle Switch"
subtitle:   "Making a look alike ext idle switch with a fog light switch and a relay"
date:       2018-10-31
tags:       [jeep]
author:     "Craig Davis"
header-img: "img/headers/xj-illuminated-extended-idle.jpg"
steps:
  - title: The Goal
    img: /img/posts/xj-extended-idle/0287-final-product.jpg
    imglink: /img/posts/xj-extended-idle/0287-final-product.jpg
    caption: Illuminated Jeep XJ extended idle switch
    instruction: |
       This [is](google.html)

  - title: The Plan
    img: /img/posts/xj-extended-idle/0028-benchtop-circuit.jpg
    imglink: /img/posts/xj-extended-idle/0028-benchtop-circuit.jpg
    caption: Benchtop circuit
    instruction: |

  - title: Find an OEM Fog Light Toggle Switch
    img: /img/posts/xj-extended-idle/0038-new-old-stock-switch.jpg
    imglink: /img/posts/xj-extended-idle/0038-new-old-stock-switch.jpg
    caption: New Old Stock Switch
    instruction: |

  - title: Comparing the Air On Board to OEM Switch
    img: /img/posts/xj-extended-idle/0040-switches-compared.jpg
    imglink: /img/posts/xj-extended-idle/0040-switches-compared.jpg
    caption: Similar, the AOB is from a nearly identical mold
    instruction: |

  - title: Disassemble both switches
    img: /img/posts/xj-extended-idle/0042-disassemble-switch.jpg
    imglink: /img/posts/xj-extended-idle/0042-disassemble-switch.jpg
    caption: Remove the face
    instruction: |

  - title: Fitting the new face onto the OEM switch body
    img: /img/posts/xj-extended-idle/0050-use-a-tap.jpg
    imglink: /img/posts/xj-extended-idle/0050-use-a-tap.jpg
    caption:
    instruction: |

  - title: Drill the hole to 1/8"
    img: /img/posts/xj-extended-idle/0052-enlarge-the-hole.jpg
    imglink: /img/posts/xj-extended-idle/0052-enlarge-the-hole.jpg
    caption:
    instruction: |
    
  - title: Assemble and test the hybrid switch
    img: /img/posts/xj-extended-idle/0056-illuminated-switch.jpg
    imglink: /img/posts/xj-extended-idle/0056-illuminated-switch.jpg
    caption: Both illumination and power indicator lighting
    instruction: |
    
  - title: Mock on the benchtop
    img: /img/posts/xj-extended-idle/0058-wired-diagram.jpg
    imglink: /img/posts/xj-extended-idle/0058-wired-diagram.jpg
    caption:
    instruction: |
    
  - title: Test operation on the benchtop
    img: /img/posts/xj-extended-idle/0063-illuminated-benchtop.jpg
    imglink: /img/posts/xj-extended-idle/0063-illuminated-benchtop.jpg
    caption:
    instruction: |

  - title: Install the new switch into the dash
    img:
    imglink:
    caption:
    instruction: |
       I don't have photos of this step, but it's very similar to [installing new fog light switched](http://there4.io/2018/09/21/Jeep-XJ-Fog-Light-Wiring-with-OEM-Rocker-Switches/)
    
  - title: Locate the engine connector
    img: /img/posts/xj-extended-idle/0277-engine-connector.jpg
    imglink: /img/posts/xj-extended-idle/0277-engine-connector.jpg
    caption:
    instruction: |
    
  - title: Extract a wire from a wiring harness connector
    img: /img/posts/xj-extended-idle/0274-junkyard-connector.jpg
    imglink: /img/posts/xj-extended-idle/0274-junkyard-connector.jpg
    caption: Contact me and I'll send a wire to you
    instruction: |
    
  - title: Add the wire to the connector and run a new wire
    img: /img/posts/xj-extended-idle/0279-splicing-wire.jpg
    imglink: /img/posts/xj-extended-idle/0279-splicing-wire.jpg
    caption:
    instruction: |
    
  - title: Add this new wire to your harness
    img: /img/posts/xj-extended-idle/0281-into-harness.jpg
    imglink: /img/posts/xj-extended-idle/0281-into-harness.jpg
    caption:
    instruction: |
    
  - title: Connect this pin A12 to the relay
    img: /img/posts/xj-extended-idle/0282-extended-idle-relay.jpg
    imglink: /img/posts/xj-extended-idle/0282-extended-idle-relay.jpg
    caption:
    instruction: |

summary: |
    Questions or comments? Let me know!
---

I've always wanted an extended idle switch for my Jeep Cherokee. The Police Package XJs were equipped with an extra toggle switch that raised the idle rpm of the Jeep when it was in park or neutral. All XJs from 1997+ have the ability to do this, but they lack the switch. The switch is something a holy grail - very few were made and the last of the new old stock (NOS) were sold on eBay for hundreds of dollars. Not all is lost though, as with some ingenuity and a bit of wiring we can make a nearly identical one ourselves.

This project is going to combine a NOS OEM fog light switch with a "fake" extended idle faceplate, and is then going to use this new switch to run a relay to activate the extended idle system.


> __Disclaimer:__ I am not a professional. This is for informational purposes only. 
> Please use fuses for all wiring, properly secure all wires, and don't do anything
> stupid. 

## Collect the Supplies

* __An Air On Board [Extended idle toggle switch](aob-switch)__  
  This is the "fake" switch. It's a three wire switch, and we only need the face plate.
* __OEM factory fog light switch__  
  These are available on eBay. Save one from a junkyard if at all possible.
* __OEM factory fog light switch pigtail__  
  Retailers don't send the connector that we need with an OEM switch. These can be found on eBay, but go to a junkyard. All XJs have an extra one for the fog light even if the fog light package wasn't installed. Be sure to clip it with the longest pigtails that you can.
* __A relay to run the extended idle system__  
  Any [four wire auto relay](https://amzn.to/2RsHJum) will work. 
* __Wiring and connectors__  
  I really prefer to match factory wiring colors. In particular, the A12 wire from the computer is grey. I solder and heat shrink wiring.

## Overview

The Jeep XJ 4.0 in 1997+ vehicles will enter extended idle when pin A12 from the computer is grounded. The factory switch did this on its own. Unfortunately, the closest available switch is a fog light switch. These switches can only control a positive hot wire. We'll need to use a positive fog light switch to control a relay that will ground pin A12.

I hate cutting factory harnesses, and so I've taken an extra step in my installation. There is an engine connector on the passenger side of the motor that contains a gray wire that runs all the way back to pin 12. You can disassemble this connect and add a new wire and then run this wire to your new relay. This prevents you from having to hack on anything. 

## Extras

I have [a fairly cheap benchtop power supply](https://amzn.to/2qkX1pB) that I really enjoy having around. It makes it easy to mock up these sorts of projects before installing them. I've got a multimeter that is no longer being sold. One day I'll have a Fluke, but until then the little one I've got is good enough. For a project like this the continuity tester is especially nice. It's really nice if it's a nice loud tone for hearing it over other fans and equipment. Imagine hearing it under the hood while you're flipping a switch inside the Jeep!

[aob-switch]: https://www.aironboard.com/online/ext-idle-3c34-tj-jeep-rocker-switch.html
[gctent]: https://www.shapeways.com/shops/gctent
[forum]: https://www.cherokeeforum.com/f2/making-ext-idle-switch-242355/










