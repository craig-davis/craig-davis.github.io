---
layout:     post
title:      "Google Event Tracking from PHP"
subtitle:   "Charting downloads from PHP"
description: "Sending Google Analytics event-tracking requests from PHP to count downloads that bypass browser-side JavaScript."
date:       2011-08-23 07:43
tags:       [php]
topic: software
author:     "Craig Davis"
header-img: "img/headers/mushroom.jpg"
---

Please see the GitHub project page for [PHP Analytics Event](https://github.com/there4/php-analytics-event).

{% highlight php %}
<?php

require_once "class.Analytics.php";

// Send latest command line client zip file.
header(…);
readfile(…);

// Record the download event in Analytics
$events = new Analytics("UAxxxxxxx", "example.com");
$events->trackEvent("resources", "download", "cli-latest");

{% endhighlight %}
