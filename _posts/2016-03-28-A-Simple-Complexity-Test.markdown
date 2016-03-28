---
layout:     post
title:      "A Simple Complexity Test"
subtitle:   "Quickly understanding a new code project and planning refactoring"
date:       2016-03-28
tags:       [php, javascript]
author:     "Craig Davis"
header-img: "img/headers/tool-chart.jpg"
---

[phploc]: https://github.com/sebastianbergmann/phploc "A tool for quickly measuring the size of a PHP project."
[phpmd]: https://phpmd.org/ "PHP Mess Detector"
[router]: https://github.com/slimphp/Slim/blob/3.x/Slim/Router.php "Slim 3 Router"
[complexity]: https://modess.io/npath-complexity-cyclomatic-complexity-explained/ "NPath complexity and cyclomatic complexity explained"
[coverage]: https://phpunit.de/manual/current/en/code-coverage-analysis.html "PHPUnit Code Coverage Analysis"

## Getting a feel for a project

When I'm looking at a project for maintenance or refactoring, I always quickly browse around the code and do some spot checks. I will often run [phploc][phploc] and [phpmd][phpmd] and look at the reports. But even before I do that, I tend to do a simple test on a file that I may be working on. I zoom out - way out.

## The Zoom Test

Shrink your IDE font size, and look at the file. Examine it for two things, color change, and indententation. Let's look at the [Slim 3 Router][router]:

![Slim 3 Router](/img/posts/simple-complexity-test/router.png)

With this view, we can see the overall structure of the file. In this case, we can see that we've got some nesting in this method, and we can use that as a starting point in our hunt for complexity.

The color changes let us know about distribution of variables and keywords, and the overall indentation gives us a feel for [the complexity][complexity] in the file.

When we zoom back in we'll find nested foreach statements.

![Slim 3 nesting](/img/posts/simple-complexity-test/nesting.png)

## Summary

This alone isn't worth using as a way to target code for refactoring. But, it is a data point when deciding what to do with a file. I think this simple test can be used to give you a feel for a file, and with some other data provided by [phpmd][phpmd] and a [code coverage analysis][coverage], it can certainly help you decide where the bugs might be hiding, and a path through your code might exist that you haven't completely addressed.
