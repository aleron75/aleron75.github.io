---
layout:   post
title:    "DDD journey: aggregates and repositories"
date:     2021-03-04 05:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/ddd-journey.jpg"
tags:     [ddd]
---

## Foreword
In the last months, I had the pleasure to attend several **reading sessions** with [Matthias Noback](https://matthiasnoback.nl/), the author of [Advanced Web Application Architecture](https://www.goodreads.com/book/show/54179859-advanced-web-application-architecture) book.

During our sessions, I took the chance to ask the author some questions that emerged while reading the mentioned book.

In the series of my short **DDD journey** articles, I'll summarize some of the **insights** that came out speaking with the author. 

I hope these articles can be helpful to those that read the book; I warmly recommend it if you haven't already done: [get it with a special discount](https://leanpub.com/web-application-architecture/c/RONCHI) that the author reserved to the readers of my blog!

## How to save child entities of an aggregate?
Let's first recap what is an aggregate with [Martin Fowler's definition](https://martinfowler.com/bliki/DDD_Aggregate.html):

*"An aggregate is a cluster of domain objects that can be treated as a single unit. An example may be an order and its line-items, these will be separate objects, but it's useful to treat the order (together with its line items) as a single aggregate."*

I was just modeling an order aggregate and its order lines in a sample **Laravel** project to apply the book's teachings.

Since I was using Laravel's **Eloquent ORM** and Eloquent's models can be related only to a single table, I mistakenly added both an `OrderRepository` and an `OrderLinesRepository` as Eloquent models.

I thought it could be the right thing to do because of the following sentence from Noback's book on page 247 that I misinterpreted:

*"Don’t make changes to multiple entities in the same transaction."*

It wasn't wrong to store order lines in a **separate table**; what was wrong with my design was that by using a **separate repository**, I was violating the very concept of an aggregate, summarized by Martin Fowler as follows:

*"Aggregates are the basic element of transfer of data storage - you request to load or save whole aggregates. Transactions should not cross aggregate boundaries."*

To solve the problem, I gave up using Eloquent, deleted `OrderLinesRepository`, and made the `OrderRepository` responsible for saving the aggregate as a whole.

Enjoy!
---
Photo credits: [Dylan Gillis](https://unsplash.com/@dylandgillis?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText) - [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/2.0/)