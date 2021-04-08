---
layout:   post
title:    "DDD journey: what's the difference between domain and application services?"
date:     2021-04-08 05:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/ddd-journey.jpg"
tags:     [ddd]
---

## Foreword
In the series of my short [DDD journey](/blog/tag/ddd/) articles, I'll summarize some of the **insights** that came out speaking with the author of the [Advanced Web Application Architecture](https://www.goodreads.com/book/show/54179859-advanced-web-application-architecture) book.

Thanks to the author, you can [get it with a special discount](https://leanpub.com/web-application-architecture/c/RONCHI) reserved to the readers of this blog!

## Domain and application services
Before going through the difference between domain and application services, let's see where they live inside our target architecture, looking at a picture that *hopefully* explains everything.

![The picture that (hopefully) explains everythhing](/img/ddd-journey/awaa-domain-application-services.png){:class="img-responsive"}

Both applications and domain services belong to our **application's core layer**, so it's clear that they are not part of the infrastructure layer.

I will not dwell on the **importance of decoupling from infrastructure**, Noback dedicates an entire chapter of his book to this topic, and I warmly recommend reading it. You can also refer to [this excerpt](https://matthiasnoback.nl/2021/03/decoupling-from-infrastructure-conclusion/) that contains a couple of sections from the conclusion of the chapter.

I go straight to the point of my question: *what is the difference between domain and application services?*

We can think of **application services** as **use cases**, e.g., *order an ebook* or *give me the list of available ebooks*.

These services are available to **consumers** of our application that live in the infrastructure layer. To make an example, a web controller is a consumer of our application services.

On the other hand, **domain services** can be considered **implementation details**, e.g., *calculate the order total*, and are mainly used inside the domain and **not exposed** to the application's consumers.

## Closing remarks
We should never directly expose a domain service to infrastructure.

If an application's consumer needs to access a domain service, we should proxy it through an application service.

Enjoy!
