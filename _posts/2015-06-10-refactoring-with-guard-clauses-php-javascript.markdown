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
function calculateSalePrice($item, $discount = 100) {
    $price = false;
    if ($discount == 100) {
        $price = $item->getPrice();
    }
    else {
        $price = calculateDiscountedPrice($item->getPrice, $discount);
    }
    return $price;
}
{% endhighlight %}

#### Behavior
This function checks the system if armed, or reschedules a check at a later time.

#### Explanation
This code is nearly fifty percent boilerplate code.


### 2. Code with If/Else and Early Return
{% highlight php startinline %}
function calculateSalePrice($item, $discount = 100) {
    if ($discount == 100) {
        return $item->getPrice();
    }
    else {
         return calculateDiscountedPrice($item->getPrice, $discount);
    }
}
{% endhighlight %}

#### Behavior
The logical flow of this is identical to Example 1.

#### Explanation
You must use a certain amount of mental math to invert the condition to determine when the alarm is recheduled rather than checked.

### 3. Code Without Else
{% highlight php startinline %}
function calculateSalePrice($item, $discount = 100) {
    if ($discount == 100) {
        return $item->getPrice();
    }
    return calculateDiscountedPrice($item->getPrice, $discount);
}
{% endhighlight %}

#### Behavior
The logical flow of this is identical to Example 1 and 2. However, there is now an explicit return statement, and we've reducded the function by two lines.

#### Explanation
While we have greatly reduced the amount of boilerplate from example 1, we've ended up with a function where the primary goal of the function is nested within an `if`. In refactoring with guard clauses, we want to be able to skip reading the guards and see the **primary** goal of the method. In this case, the primary goal of the function is to run the `systemCheck`, and so we need to clarify the function a bit.


### 4. Code Without Else with an Inverted Control
{% highlight php startinline %}
function calculateSalePrice($item, $discount = 100) {
    if ($discount !== 100) {
        return calculateDiscountedPrice($item->getPrice, $discount);
    }
    return $item->getPrice();
}
{% endhighlight %}

#### Behavior
The logical flow of this is the _opposite_ of example 3 in that we're now using a guard statement. We have moved the primary goal of the function into the main body of the function.

#### Explanation
By moving our primary goal of the method to the main body of the function, we've greatly simplified the method by both reducing the cyclomatic complexity, and by making it very clear under what conditions we _don't_ do our main goal.

## Actual Code Example

While this is a fictitious example, this code is somewhat believable. With a little reasoning, you can examine this code and see how it could have grown into being in the current state that it's in.

In the following example a post is editable if:

* The user is an editor or an administrator
* The user is the author and the post was written in the last thirty days.

### Original Code

{% highlight php startinline %}
class Post
{
    public function canEdit($user)
    {
        $canEdit = false;
        if (($user->getRole() == 3 && $this->getEditorId() == $user->getId()) || $user->getRole() > 5 || ($this->getAuthorId() == $user->getId() && $this->getCreatedOn < time() - 2592000)) {
            $canEdit = true;
        }
        return $canEdit;
    }
}
{% endhighlight %}

### Refactored Code, Step One.

(Draft, discussion to come.)

{% highlight php startinline %}
class Post
{
    public function canEdit($user)
    {
        $isEditor = $user->getRole() == 3 && $this->getEditorId() == $user->getId();
        $isAdmin  = $user->getRole() > 5;
        $isAuthor = $this->getAuthorId() == $user->getId();
        $isTooOld = $this->getCreatedOn < time() - 2592000;

        if ($isEditor || $isAdmin) {
            return true;
        }

        if ($isAuthor && !$isTooOld) {
            return true;
        }

        return false;
    }
}
{% endhighlight %}
