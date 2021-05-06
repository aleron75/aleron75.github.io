---
layout:   post
title:    "DDD journey: how much information should an event contain?"
date:     2021-05-06 05:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/ddd-journey.jpg"
tags:     [ddd]
---

## Foreword
In the series of my short [DDD journey](/blog/tag/ddd/) articles, I'll summarize some of the **insights** that came out speaking with the author of the [Advanced Web Application Architecture](https://www.goodreads.com/book/show/54179859-advanced-web-application-architecture) book.

Thanks to the author, you can [get it with a special discount](https://leanpub.com/web-application-architecture/c/RONCHI) reserved to the readers of this blog!

## TLDR: as much as possible
Suppose we dispatch an event when an order has been created and we only pass the order id. 

Then a listener needs to retrieve the order by id. 

The order **data can change** between order creation and order retrieval, even if that time is just some milliseconds. 

That means that the order state retrieved by the listener is not guaranteed to represent the order state when the event was dispatched. 

Thus, passing the entire order in the event has two benefits:

- we avoid the need of fetching data;
- we have the exact state of the object when the event was registered.

Enjoy!