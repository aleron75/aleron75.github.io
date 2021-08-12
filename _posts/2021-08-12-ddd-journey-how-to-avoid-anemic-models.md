---
layout:   post
title:    "DDD journey: how to avoid anemic models?"
date:     2021-08-12 05:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/ddd-journey.jpg"
tags:     [ddd]
---

## Foreword
In the series of my short [DDD journey](/blog/tag/ddd/) articles, I'll summarize some of the **insights** that came out speaking with the author of the [Advanced Web Application Architecture](https://www.goodreads.com/book/show/54179859-advanced-web-application-architecture) book.

Thanks to the author, you can [get it with a special discount](https://leanpub.com/web-application-architecture/c/RONCHI) reserved to the readers of this blog!

## Why this question
When we design an application following the Domain-Driven Design principles, an application (or service) layer takes shape. We can be tempted to put all our business logic inside that layer. By doing so, we can end up with a lot of anemic models.

## What is an anemic model?
To use [Martin Fowler's words](https://martinfowler.com/bliki/AnemicDomainModel.html), we have an anemic model *"when we look at the behavior, and we realize that there is hardly any behavior on these objects, making them little more than bags of getters and setters."*

This effect happens when we put all our business logic in classes belonging to the service layer, relegating the simple role of Data Transfer Objects (DTO) for models.

## How to avoid anemic models
To avoid anemic models, service classes should only play the role of **coordinators**. In contrast, domain models should expose **behavioral methods** rather than getters and setters, **hiding internal details** as much as possible.

A way to obtain this result is using the *tell, don't ask* principle. Once again, [Martin Fowler's explanation](https://martinfowler.com/bliki/TellDontAsk.html) is crystal clear: *"rather than asking an object for data and acting on that data, we should instead tell an object what to do. This approach encourages to move behavior into an object to go with the data."*

Additionally, doing so makes the service classes *tellers* rather than *doers*, that is, coordinators.

To explain it through an example, let's implement an oversimplified order model. 

To change the state of the order, we can be tempted to use the following code:

```php
namespace Awaa\Oms\Domain\Model\Order;

// ...

final class Order
{
    private OrderId $id;

    private OrderState $state; 

    public function __construct(OrderId $id, OrderState $state)
    {
        $this->id = $id;
        $this->state = $state;
    }

    // ...

    //No behavior here, just modifying the model's state
    public function setState(OrderState $state): void
    {
        $this->state = $state;
    }

    public function getState(): OrderState
    {
        return $this->state;
    }

}
``` 

The above implementation violates the *tell don't ask* principle and forces us to **delegate the behavior** related to cancel an order to service classes.

The following implementation, instead, movies the behavior into the object:

```php
namespace Awaa\Oms\Domain\Model\Order;

// ...

final class Order
{
    private OrderId $id;

    private OrderState $state; 

    private function __construct(OrderId $id, OrderState $state)
    {
        $this->id = $id;
        $this->state = $state;
    }

    // ...


    // We can implement the behavior related to canceling an order here...
    public function cancel(): Order
    {
        $order = new self($this->id, OrderState::fromString('canceled'))
        // ...like, for example, registering a domain event.
        return $order;
    }
}
```

As an additional benefit, the above implementation makes it easier to apply the principle of **immutability** by returning a new instance of the object when the `cancel()` method is invoked instead of changing the object's internal state.

Enjoy!
