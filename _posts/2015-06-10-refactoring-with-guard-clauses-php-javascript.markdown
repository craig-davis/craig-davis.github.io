---
layout:     post
title:      "Reducing Complexity by Refactoring with Guard Clauses"
subtitle:   "Else is a code smell in PHP and JavaScript"
date:       2015-06-10
tags:       [php, javascript]
author:     "Craig Davis"
header-img: "img/headers/paper-clock.jpg"
---

## (Draft) Else is a Code Smell

A single exit point for a function can lead to increased complexity.

### 1. Code with Traditional If/Else
{% highlight php startinline %}
function checkAlarm() {
    $return = false;
    if (isArmed()) {
        $return =  systemCheck();
    }
    else {
        $return =  rescheduleAlarmCheck();
    }
    return $return;
}
{% endhighlight %}

#### Behavior
This function checks the system if armed, or reschedules a check at a later time.

#### Explanation
This code is nearly fifty percent boilerplate code.


### 2. Code with If/Else and Early Return
{% highlight php startinline %}
function checkAlarm() {
    if (isArmed()) {
        return systemCheck();
    }
    else {
        return rescheduleAlarmCheck();
    }
}
{% endhighlight %}

#### Behavior
The logical flow of this is identical to Example 1.

#### Explanation
You must use a certain amount of mental math to invert the condition to determine when the alarm is recheduled rather than checked.

### 3. Code Without Else
{% highlight php startinline %}
function checkAlarm() {
    if (isArmed()) {
        return systemCheck();
    }
    return rescheduleAlarmCheck();
}
{% endhighlight %}

#### Behavior
The logical flow of this is identical to Example 1 and 2. However, there is now an explicit return statement, and we've reducded the function by two lines.

#### Explanation
While we have greatly reduced the amount of boilerplate from example 1, we've ended up with a function where the primary goal of the function is nested within an `if`. In refactoring with guard clauses, we want to be able to skip reading the guards and see the **primary** goal of the method. In this case, the primary goal of the function is to run the `systemCheck`, and so we need to clarify the function a bit.


### 4. Code Without Else with an Inverted Control
{% highlight php startinline %}
function checkAlarm() {
    if (!isArmed()) {
        return rescheduleAlarmCheck();
    }
    return systemCheck();
}
{% endhighlight %}

#### Behavior
The logical flow of this is the _opposite_ of example 3 in that we're now using a guard statement. We have moved the primary goal of the function into the main body of the function.

#### Explanation
By moving our primary goal of the method to the main body of the function, we've greatly simplified the method by both reducing the cyclomatic complexity, and by making it very clear under what conditions we _don't_ do our main goal.

## Actual Code Example

{% highlight php startinline %}
// Actual code, coming soon.
{% endhighlight %}
