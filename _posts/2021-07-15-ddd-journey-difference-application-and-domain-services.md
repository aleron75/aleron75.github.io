---
layout:   post
title:    "DDD journey: what's the difference between a domain service and an application service?"
date:     2021-07-15 05:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/ddd-journey.jpg"
tags:     [ddd]
---

## Foreword
In the series of my short [DDD journey](/blog/tag/ddd/) articles, I'll summarize some of the **insights** that came out speaking with the author of the [Advanced Web Application Architecture](https://www.goodreads.com/book/show/54179859-advanced-web-application-architecture) book.

Thanks to the author, you can [get it with a special discount](https://leanpub.com/web-application-architecture/c/RONCHI) reserved to the readers of this blog!

## Application and domain services
One of the points that I didn't get immediately while reading Noback's book was the purpose of domain services, compared to application services.

After asking the author to shed some light, I got the difference.

We can think of **application services** as **use cases**, e.g., *order an e-book* or *give me the list of available e-books*. 

In other words, application services represent what a client (usually called *primary actor*) can do with our application.

Application services belong to the core, precisely to the **application layer**.

Conversely, **domain services** can be considered **implementation details**, e.g., *calculate the order total*. 

They also belong to the core, encapsulated into the **domain layer**. 

Thus, domain services are used **inside the domain** and not directly exposed to the clients of our application.

Enjoy!