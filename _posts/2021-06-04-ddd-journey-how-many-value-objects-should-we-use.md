---
layout:   post
title:    "DDD journey: how many value objects should we use?"
date:     2021-06-04 05:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/ddd-journey.jpg"
tags:     [ddd]
---

## Foreword
In the series of my short [DDD journey](/blog/tag/ddd/) articles, I'll summarize some of the **insights** that came out speaking with the author of the [Advanced Web Application Architecture](https://www.goodreads.com/book/show/54179859-advanced-web-application-architecture) book.

Thanks to the author, you can [get it with a special discount](https://leanpub.com/web-application-architecture/c/RONCHI) reserved to the readers of this blog!

## TLDR: the more, the better
One thing I started doing after reading Noback's book was using value objects.

Using [the words of Martin Fowler](https://martinfowler.com/bliki/ValueObject.html), *value objects are a way to represent things as a compound*. 

Using value objects instead of scalars for class property types has some benefits.

In fact, we can **encapsulate validation logic** inside the constructors of value objects. 

Say that we need an email property in a `User` class. Instead of using a `string` type for the email, we create a value object like this:

```php
final class Email
{
    private string $address;

    private function __construct(string $address)
    {
        $emailRegEx = 'TODO: your preferred email validation regex';
        if (0 === \preg_match($emailRegEx, $address)) {
            throw new InvalidArgumentException('invalid email address');
        }

        $this->address = $address;
    }

    public static function fromString(string $string)
    {
        return new self($string);
    }

    public function asString()
    {
        return $this->address;
    }
}
```

Using the `Email` type in the `User` class allows us to **protect its internal consistency**. In other words, we don't have any way to instantiate a `User` object with an invalid email.

The more value objects we use, the better.

Enjoy!