---
layout:     post
title:      "Handlebars Helpers for Debugging and Pluralization"
subtitle:   "Template scope debugging made easy"
tags:       [javascript]
author:     "Craig Davis"
header-img: "img/headers/hinterglemm.jpg"
---

I often find it helpful to dump a handlebars scope out to the console. This
snippet has been quite useful.

Be careful that this doesn't make it to production - for instance it would be
good to have a linter check for these {{debug}} statements in your html templates.


{% highlight javascript %}
define([
   "use!underscore",
   "use!handlebars",
   "moment"
 ],

 function(
  _, Handlebars, Moment
 ) {

   // usage: {{toLowerCase someString}}
   Handlebars.registerHelper('toLowerCase', function(value) {
     return (value && _.isString(value)) ? value.toLowerCase() : '';
   });

   // usage: {{debug}} or {{debug someValue}}
   Handlebars.registerHelper("debug", function(optionalValue, options) {
     console.group("Handlebar Debug:");
     console.log(this);
     if (_.isObject(optionalValue) && _.isObject(optionalValue.hash)) {
       // this means that the {{debug}} was called without params
     }
     else {
       console.log(optionalValue);
     }
     console.groupEnd();
   });

   // usage: {{pluralize collection.length 'quiz' 'quizzes'}}
   Handlebars.registerHelper('pluralize', function(number, single, plural) {
     return (number === 1) ? single : plural;
   });

  // usage: {{fromNow date}}
  Handlebars.registerHelper('fromNow', function(date) {
    moment = new Moment(date);
    return moment.fromNow();
  });

 });

 /* End of file handlebars.helpers.js */

 {% endhighlight %}
