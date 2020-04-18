---
layout:   post
title:    "Why we test code"
date:     2018-09-26 00:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/2018-09-26-why-we-test-code.jpg"
tags:     [testing]
---
This is my take on a subject that was discussed on [dev.to](https://dev.to/kayis/what-are-the-alternatives-to-unit-tests-2jii). The following post is my comment on that article that  I decided to persist on this blog too.

- - -

First of all, I think that this quote is fundamental to understand **why we test our code**:

_“Testing shows the presence, not the absence of bugs”_ ~ E. W. Dijkstra

It means that our tests can't prove the correctness of our code, they can only prove that our code is safe against the bugs that we are looking for.

Having 100% code coverage doesn't guarantee that our code is 100% correct and bug-free.

It only means that our code is 100% safe against the bugs that we are looking for.

There may be bugs we aren't looking for even with a 100% code coverage passing tests.

Tests show the presence, not the absence of bugs.

- - -

[Chris James](https://dev.to/quii/comment/403f) says: _"the very definition of refactoring is changing the code without changing behavior."_

 The behavior refactoring refers to is **external behavior**, that is, the expected outcome of a piece of code, not how the code behaves internally.

When we write a test, we can make assertions about internal behavior but it can change without modifying the expected output.
That's the very definition of refactoring.

When we make assertions about the internal behavior, we are coupling our test to an implementation: internal behavior changes will likely bring to change the test.

That's why I like what [Michał T.](https://dev.to/pies/comment/403j) says: _"code that is perfectly suited for unit tests are things that have predictable inputs and outputs, and don't have dependencies or global effects."_

The assertions about the behavior of our code will likely depend on the behavior of our dependencies.

Indeed, we mock external dependencies because we don't want our code being affected by their potentially bugged outcome.
Thus, we set up our environment to have a predictable output.

That's why even if external dependencies have bugs, our unit tests can pass. And that's why unit tests aren't enough to save us from having issues.

Reducing external dependencies will make our code easier to test and less prone to side effects coming from the outside.

- - -

My last thought, starting with this quote from [conectionist](https://dev.to/conectionist/comment/4049): _"code changes happen all the time and unit tests have to change with them. It's unpleasant but necessary."_

Software, by definition, is **soft** to adapt to changes. 
Otherwise, it would have been "hard" ware.

We have to deal with it. It should not be unpleasant but the opposite: it's its the **ability to change** that proves the real value of software.

The frustration that we feel when we have to change our software comes from the fact that as long as we add code we tend to reduce the flexibility of our software (we add accidental complication).

Thus, adapting to changes becomes frustrating.

But it's not software's fault. 
It's not our customers' fault.
It's our fault.

It's only by making our code **better over time** that we can reduce that frustration.

And we can make it better by performing refactoring on a regular basis.

Everything that encourages refactoring should be welcome.

I warmly recommend [watching this](http://vimeo.com/78898380).

- - -

Photo credits: [Sue Thomas](https://unsplash.com/@suethomas) - [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/2.0/)
