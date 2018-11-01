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
       This is the final installation of the switch. This switch has working backlighting and an illuminated orange indicator light when the switch is in the on position. This switch panel is from [GCT Enterprises](https://www.shapeways.com/shops/gctent) and is the 5 OEM Switch + 1 Toyota Small Push panel. I've got more information about it in [another post](http://127.0.0.1:4000/2018/09/21/Jeep-XJ-Fog-Light-Wiring-with-OEM-Rocker-Switches/).

  - title: The Plan
    img: /img/posts/xj-extended-idle/0028-benchtop-circuit.jpg
    imglink: /img/posts/xj-extended-idle/0028-benchtop-circuit.jpg
    caption: Benchtop circuit
    instruction: |
        Here is the first mockup with the AOB three wire switch. This does not feature the backlighting, but it's running the circuit. The multimeter is in continuity mode and is attached across pins 87 and 30. The switch is supplying power to the relay via 86, and 85 is ground. The switch is getting power on red and the white is switched to the relay. The fog light will soon be placed into this with the addition of one more wire to run the factory backlight illumination.

  - title: Find an OEM Fog Light Toggle Switch
    img: /img/posts/xj-extended-idle/0038-new-old-stock-switch.jpg
    imglink: /img/posts/xj-extended-idle/0038-new-old-stock-switch.jpg
    caption: New Old Stock Switch
    instruction: |
        Here's the OEM fog light switch. This one appears to have lived a long time on a dealer shelf before finding it's home on my bechtop. We'll be replacing the Fog Light switch face on this one with the `Ext Idle` switch face from the other switch.

  - title: Comparing the Air On Board to OEM Switch
    img: /img/posts/xj-extended-idle/0040-switches-compared.jpg
    imglink: /img/posts/xj-extended-idle/0040-switches-compared.jpg
    caption: Similar, the AOB is from a nearly identical mold
    instruction: |
        The switch from AOB is really interesting, it's almost as if it came out of the same mold but without the punch out for the factory backlighting. We'll be taking both switches apart.

  - title: Disassemble both switches
    img: /img/posts/xj-extended-idle/0042-disassemble-switch.jpg
    imglink: /img/posts/xj-extended-idle/0042-disassemble-switch.jpg
    caption: Remove the face
    instruction: |
        With two small screwdrivers, you can gently spread the sides of the switch to allow the face to be pulled directly outwards.

  - title: Fitting the new face onto the OEM switch body
    img: /img/posts/xj-extended-idle/0050-use-a-tap.jpg
    imglink: /img/posts/xj-extended-idle/0050-use-a-tap.jpg
    caption: Replace the fog light face with the face from the `Ext Idle`
    instruction: |
        The `Ext Idle` face has a slightly larger pin on one side and won't fit into the OEM body without enlarging the hole. In my case, both pins on the `Ext Idle` face were 1/8". You can ream the small hole in the OEM switch body to fit. 

  - title: Drill the hole to 1/8"
    img: /img/posts/xj-extended-idle/0052-enlarge-the-hole.jpg
    imglink: /img/posts/xj-extended-idle/0052-enlarge-the-hole.jpg
    caption: The OEM switch body has a smaller hole on one side that we need to enlarge
    instruction: |
        I used a drill bit to do this, and for something so delicate it's best to do this by hand. I like using a [tap handle](https://amzn.to/2Jv5oaP) to hold the bit in this case. Sneak up on the size and test fit it to make sure you don't end up with a sloppy fit.
    
  - title: Assemble and test the hybrid switch
    img: /img/posts/xj-extended-idle/0056-illuminated-switch.jpg
    imglink: /img/posts/xj-extended-idle/0056-illuminated-switch.jpg
    caption: Both illumination and power indicator lighting
    instruction: |
        Here's the first try of the new hybrid switch. This is powering both the orange factory backlighting wire and the blue run source wire. The black wire is grounded.
    
  - title: Mock on the benchtop
    img: /img/posts/xj-extended-idle/0058-wired-diagram.jpg
    imglink: /img/posts/xj-extended-idle/0058-wired-diagram.jpg
    caption: Confirm that everything works
    instruction: |
        Here's the switch placed into our mockup on the benchtop. While this is a pretty simply circuit, I think it's nice to be able to see it outside of the Jeep.
    
  - title: Test operation on the benchtop
    img: /img/posts/xj-extended-idle/0063-illuminated-benchtop.jpg
    imglink: /img/posts/xj-extended-idle/0063-illuminated-benchtop.jpg
    caption: Everything I'd hoped for
    instruction: |
        The multimeter in continuity mode is across pins 87 and 30 and will tone when the switch is in the on position. 12v has been added to the factory orange illumination wire.

  - title: Install the new switch into the dash
    img:
    imglink:
    caption:
    instruction: |
       I don't have photos of this step, but it's very similar to [installing new fog light switches](http://there4.io/2018/09/21/Jeep-XJ-Fog-Light-Wiring-with-OEM-Rocker-Switches/). The orange illumination is added to a splice with the other orange wires. The run source wire goes to anything that is on when the vehicle is on. We don't want to introduce a power draw if the vehicle is off. I chose to use the 12v and ground available from the cigarette lighter from the drivers side.
    
  - title: Locate the engine connector
    img: /img/posts/xj-extended-idle/0277-engine-connector.jpg
    imglink: /img/posts/xj-extended-idle/0277-engine-connector.jpg
    caption: This connector is on the passenger side near the back of the valve cover
    instruction: |
        Pin A12 from the computer terminates in this connector. It's located on the passenger side of the engine and can be identified with the red safety clip on it. In my case, I hate cutting into wiring harnesses, and instead of adding a splice near the PCM or even cutting that wire, I chose to add a new wire to this connector. The grey wire from A12 comes into this connect, and the other side of the connector simply has a blocked port in it's place. We can pull the little block out and add a new wire.
    
  - title: Extract a wire from a wiring harness connector
    img: /img/posts/xj-extended-idle/0274-junkyard-connector.jpg
    imglink: /img/posts/xj-extended-idle/0274-junkyard-connector.jpg
    caption: Contact me and I'll send a wire to you
    instruction: |
        I clipped one of these connectors in the junkyard. You can disassemble the connect and remove one of the pins from it. It's helpful to have a [pin extractor set](https://amzn.to/2RqR7P2), but you can use a tiny screwdriver to depress the pin underneath the crimped wire end. Pay attention to how this connector is disassembled, if you choose to go this route, you'll have to also do the same to the one in your engine bay. **Note:** This is a bit of a warning. This connector is important. If you have brittle plastics on your Jeep, this might not be worth doing. You may have better luck using a [wire tap](https://amzn.to/2DgCECd) and not risk breaking your connector.
    
  - title: Add the wire to the connector and run a new wire
    img: /img/posts/xj-extended-idle/0279-splicing-wire.jpg
    imglink: /img/posts/xj-extended-idle/0279-splicing-wire.jpg
    caption: Add a new wire to pickup pin A12
    instruction: |
        You can gently remove the back from your connector, slide the rubber up a bit and then add your new wire. It'll be across from the grey wire, and it's good to check for continuity from that pin to A12 on the PCM. To get to A12, you pull the black wire connector on the PCM that is closest to the front of the Jeep. Each pin is labeled. You can use your multimeter from that pin to the pin on the connector to verify that you're in the right spot. On the connector back you'll also need to remove a little plug that was in place of this wire that you're adding. That plug ass helping to waterproof the connector.
    
  - title: Add this new wire to your harness
    img: /img/posts/xj-extended-idle/0281-into-harness.jpg
    imglink: /img/posts/xj-extended-idle/0281-into-harness.jpg
    caption: Route this wire to the relay location
    instruction: |
        After the wire has been added to the connector, you can connect a new grey wire to it and run that wire to the location where you'll be keeping your relay. My relay is currently in the engine bay, but it will soon be relocated to be under my dash. That relay will also be getting the positive source from the switch.
    
  - title: Connect this pin A12 to the relay
    img: /img/posts/xj-extended-idle/0282-extended-idle-relay.jpg
    imglink: /img/posts/xj-extended-idle/0282-extended-idle-relay.jpg
    caption: Wire the relay
    instruction: |
        Here's the relay wired up and done.  
            __Pin 85__: Ground  
            __Pin 86__: Positive from switch  
            __Pin 87__: A12 from PCM  
            __Pin 30__: Ground  

summary: |
    This was a fun project. It combines a little but of Jeep XJ history with a practical application. If you haven't worked with relays before this is a fun project. I recommend building this on the bench first, as you'll get a chance to fiddle with the components and take some of the mystery out of relays. 

    Please be careful with the project and never connect 12v positive to your PCM by accident!

    Questions or comments? Let me know!
---

I've always wanted an extended idle switch for my Jeep Cherokee. The Police Package XJs were equipped with an extra toggle switch that raised the idle rpm of the Jeep to 1100rpm when it was in park or neutral. All XJs from 1997+ have the ability to do this, but they lack the switch. The switch is something a holy grail - very few were made and the last of the new old stock (NOS) were sold on eBay for hundreds of dollars. Not all is lost though, as with some ingenuity and a bit of wiring we can make a nearly identical one ourselves.

This project is going to combine a NOS OEM fog light switch with a "fake" extended idle faceplate, and is then going to use this new switch to run a relay to activate the extended idle system.


> __Disclaimer:__ I am not a professional. This is for informational purposes only. 
> Please use fuses for all wiring, properly secure all wires, and don't do anything
> stupid. Please be careful with the project and never connect 12v positive to your 
> PCM by accident!

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

## Factory Service Manual

> The extended idle switch will control a ground circuit going to the powertrain control module (PCM). When a ground signal (through the switch) has been received at pin/cavity A-12 (circuit K78) of the PCM, engine idle speed will increase.

The FSM has a diagnostic test that outlines the system and offers troubleshooting advice. It's a great resource. It's in section 14-43, and I've got [a screenshot of it][fsm] for reference.


## Extras

I have [a fairly cheap benchtop power supply](https://amzn.to/2qkX1pB) that I really enjoy having around. It makes it easy to mock up these sorts of projects before installing them. I've got a multimeter that is no longer being sold. One day I'll have a Fluke, but until then the little one I've got is good enough. For a project like this the continuity tester is especially nice. It's really nice if it's a nice loud tone for hearing it over other fans and equipment. Imagine hearing it under the hood while you're flipping a switch inside the Jeep!

[fsm]: /img/posts/xj-extended-idle/fsm-ext-idle-troubleshooting.png
[aob-switch]: https://www.aironboard.com/online/ext-idle-3c34-tj-jeep-rocker-switch.html
[gctent]: https://www.shapeways.com/shops/gctent
[forum]: https://www.cherokeeforum.com/f2/making-ext-idle-switch-242355/










