---
layout:     post
title:      "Enable MySQL logging for Debugging at Runtime"
subtitle:   "Tail the MySQL query log"
date:       2015-05-05
tags:       [mysql]
author:     "Craig Davis"
header-img: "img/headers/dodge.jpg"
---

Starting with MySQL 5.1 you can enable and disable logs at runtime. This allows you to tail the general and slow query log from the command line and keep an eye on things. This can be especially useful when running with an ORM and you want to see the final queries as executed.

## Enable Logging

This approach does not require a server restart. Login to MySQL as the root user via `mysql -u root -p` and then issue the following:

{% highlight sql %}
SET GLOBAL general_log = 'ON';
SET GLOBAL slow_query_log = 'ON';
{% endhighlight %}

To disable logs, login to mysql client again and then issue:

{% highlight sql %}
SET GLOBAL general_log = 'OFF';
SET GLOBAL slow_query_log = 'OFF';
{% endhighlight %}

## Watching the Log File

You can use either `tail -f` or `less -F` to follow the log as it's being written to. In order to confirm the location of the log, you can run this in MySQL:

{% highlight sql %}
show variables like '%log%';
{% endhighlight %}

And then you can run something like: `tail -f /var/log/syslog`

## Mytail : MySQL Logging Made Easy

I've wrapped up this into [an easy to use command](https://gist.github.com/craig-davis/48be6978d55122677dec). This bash script `mytail` will enable the logs, tail them, and then when you exit with `ctrl+c` will disable the logs once again.

In addition, if you have a `.grc.sql.conf` file and `grc` installed from [garabik/grc](https://github.com/garabik/grc) the log will be colorized.

{% gist 48be6978d55122677dec mytail %}
