---
layout:     post
title:      "Help Scout Command Line Client"
subtitle:   "Reading conversations from the command line"
date:       2015-04-18
tags:       [php]
author:     "Craig Davis"
header-img: "img/headers/gravel.jpg"
---

I've started on a new toy project - a [command line client for Help Scout](https://github.com/helpscout/helpscout-cli-php). This project serves two purposes:

* Provide a tool for me to use during the work day
* Be an example of using the excellent [Help Scout API](http://developer.helpscout.net/help-desk-api/).

## Current Commands


    Help Scout Command Line Client version 0.0.1 by Help Scout

    Usage:
      command [options] [arguments]

    Options:
      -h, --help            Display this help message
      -q, --quiet           Do not output any message
      -V, --version         Display this application version
          --ansi            Force ANSI output
          --no-ansi         Disable ANSI output
      -n, --no-interaction  Do not ask any interactive question
      -v|vv|vvv, --verbose  Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug

    Available commands:
      customer   Show customer details
      help       Displays help for a command
      list       Lists commands
      mailbox    Show mailbox details
      mailboxes  List all mailboxes
      setup      Configure this Help Scout client
      version    Show version information
      zen        Display a Zen koan, used as an API heartbeat


## Example Output

    $ helpscout mailboxes

    ————————————————————————————————————————————————————————————————————————————————
                                  Help Scout Mailboxes
    ————————————————————————————————————————————————————————————————————————————————
     ID         Name                           Email
    ————————————————————————————————————————————————————————————————————————————————
     [25590]    Research                       research@helpscout.com
     [85]       Help Scout                     help@helpscout.net
     [2641]     Developer Support              developer@helpscout.net
     [20512]    Customer Success               coach@helpscout.com


