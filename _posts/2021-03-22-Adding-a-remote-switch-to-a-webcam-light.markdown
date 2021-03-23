---
layout:     post
title:      "Adding a Remote Switch to a Webcam Ring Light"
subtitle:   "Improve your video conferencing and streaming with a light switch"
date:       2021-03-22
tags:       []
author:     "Craig Davis"
header-img: "img/headers/webcam-light-switch.jpg"
---

{% include figure.html
    class="right"
    url="https://amzn.to/31lY2QR"
    src="/img/posts/webcam-ring-light/light-stand.small.jpg"
    alt="Amazon Webcam Ring Light"
    max-width="250px"
    caption="Amazon Webcam Ring Light"
%}

I've been setting up my home office with better organization. I've recently purchased [a ring light][ring-light] for my webcam. I've been quite happy with it and it makes a big difference in how I look during video calls. With my new organization, the switch for the light has become buried behind my monitor stand and it's a hassle to reach behind my monitors to turn it on and off. This blog post is how to add a remote switch to this particular webcam light that can be mounted on the front of a desk.

The project is faily simple. This only requires you to solder two wires onto a circuit board and modify the switch case to make room for the second wire.

## Adding an on/off switch to a webcam light


> __Disclaimer:__ I am not a professional. This is for informational purposes only.
> Please properly secure all wires, and don't do anything stupid. Be safe when soldering and don't breathe the fumes and be careful around wiring in general.


{% include figure.html
    class="left"
    url="/img/posts/webcam-ring-light/2-lighted-switch.jpg"
    src="/img/posts/webcam-ring-light/2-lighted-switch.small.jpg"
    alt="Amazon Webcam Ring Light Switch"
    max-width="250px"
    caption="Original webcam light switch"
%}

In this post, I'll share some photos of how to add a switch to a common and inexpensive webcam light. I'll include a few Amazon affiliate links to the items I used to assemble this. It looks like quite a few of the webcam lights available all use the same controller and switch, so this may be applicable to quite a few lights. In the photo to the right you can see the switch that is on mine to control the color and brightness of the light. The on/off switch is our target, we're going to add a second switch to control that.

## Materials

* [Hobby knife][knife] for trimming the switch case
* [Webcam Ring Light][ring-light]
* [Switch Housing][housing]
* [Momentary switch for controlling the light][switch]
* [Wire for the new switch][wire]

**Optional Items**

* Hot glue gun for adding some strain relief to the new switch wiring
* [Disconnects][connectors] for making the new switch removable
* Heat shrink tubing if you choose to use the connectors


## Open up the switch case
![Switch with housing removed](/img/posts/webcam-ring-light/3-circuit-board.small.jpg)

Use a small screwdriver or pick to open the original switch. In mine it was snapped together and opened without any damage. There are two tabs towards the center of the sides that hold it together.

Once it's apart, we can figure out what we need to do. In this photo the switch to the left is for power. It's a momentary switch, and we can use a multimeter to figure out that only two of its pins are used and they are diagonal across the switch. Put the leads of the multimeter on two pins and then press the button. Try the various options until [you find continuity](https://www.youtube.com/watch?v=5G622WDZaHg) when the button is depressed. It's a momentary switch and you should get continuity across the switch when the button is depressed if you've found the correct pins.

If you don't have a multimeter you could plug the light into a usb power source (NOT A COMPUTER) and use a short piece of wire to jump across the pins of the switch to figure out which ones are used. 


## Solder a new wire onto the board
![Adding wire to the factory board](/img/posts/webcam-ring-light/4-soldered-wires.small.jpg)

In this photo you can see [the new wire][wire] added to the switch. It was easier to solder to the top of the board than the bottom and I found that the diagonal pins worked to control the light. Remember to tin the ends of your wires before [soldering](https://www.makerspaces.com/how-to-solder/) them to your board.

After you've added the new wire, you'll need to carve out some material from the switch housing in order to fit the new wire. In my case I just had to scrape away some of the plastic to increase the size of the exit hole. You might have to cut off some of the plastic. Just keep trimming until the housing snaps back together with the two wires exiting the housing. 


## Prepare our new switch

I wanted a nice looking housing for the new switch. I found [a nice looking housing][housing] that would look great under my desk. Unfortunately it has an on/off switch, and we need a momentary push-button switch. Fortunately, a helpful reviewer [mentioned that the switch could be replaced](https://www.amazon.com/gp/customer-reviews/R3P0TLSFIKDA57/ref=cm_cr_dp_d_rvw_ttl). 


![Switch Housing](/img/posts/webcam-ring-light/5-switch-housing.small.jpg)


I found that [a 19mm momentary switch][switch] fit perfectly into the enclosure. The housing comes apart with a little prying. I had to use an X-Acto to cut the adhesive around the edges. It was helping to hold the top of the enclosure case to the bottom. See the photo below to see more of that detail. The old switch has tabs that hold it in place, and they are a little fiddly to depress enough to remove the switch. 

{% include figure.html
    class="left"
    url="/img/posts/webcam-ring-light/6-switch-installed.jpg"
    src="/img/posts/webcam-ring-light/6-switch-installed.small.jpg"
    alt="Momentary switch in new enclosure"
    max-width="250px"
    caption="Transplanted switch"
%}

I had to use a pair of angled needle nose pliers to be able to depress the tab on the bottom of the switch. The new switch has a nicer screw design that makes it fairly easy to install the new switch. I'd recommend putting your wires on before installing the switch, the angle of the switch makes it hard to get to the screws to tighten down on the wires. In the photo below you can see that I've added some hot glue to the new wires to add a little strain relief.


[![Switch Housing](/img/posts/webcam-ring-light/8-switch-glued.small.jpg)](/img/posts/webcam-ring-light/8-switch-glued.jpg)

If you look closely at the base you can see that the manufactuerer has left two small holes in the bottom of the base. I used these to attach the base to the underside of my desk with screws rather than with the adhesive. 

## Final installation

![Installed switch](/img/posts/webcam-ring-light/10-installed-switch.small.jpg)


## Optional Steps

In the photo below, you can see that I put [a quick disconnect][connectors] into my new wire. I needed to be able to run the wire through a hole in my desk in order to hide my cables. If I'd connected the new switch housing directly to the light, I'd have had a hard time doing that. Adding the connectors took a little extra soldering and some heat shrink tubing, but overall it was worth it for me to be able to disconnect and reconnect the switch.

![](/img/posts/webcam-ring-light/9-complete-light-with-switch.small.jpg)



{% include disclosure.html %}

[knife]: X-Acto
[ring-light]: https://amzn.to/31lY2QR
[switch]: https://amzn.to/397bP1M
[housing]: https://amzn.to/3f4JMDQ
[wire]: https://amzn.to/3rckQNa
[connectors]: https://amzn.to/2PntQ56