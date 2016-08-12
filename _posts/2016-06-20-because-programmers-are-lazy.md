---
layout:   post
title:    "Because programmers are lazy"
date:     2016-06-20 00:00:00
author:   "Alessandro Ronchi"
header-img: "img/2016-06-20-because-programmers-are-lazy.jpg"
tags:     [json, tools]
---

It's a simple story: I wanted to be able to put **comments in JSON files**,
specifically in my composer.json files.

Why? Because sometimes I want to give a try to third-party without deleting
references to them if I decide not to keep them in my composer.json file.

Or maybe sometimes I simply want to include comments above some dependencies.

You probably know that it's something not allowed by JSON parsers.

I thought that implementing a simple script that wipes out lines starting with
the `#` character would have been faster that searching for some existing
solution.

So I implemented it and just because commented lines brought to **lists with
trailing commas**, I also added some lines of code to wipe that trailing commas
too.

And that's almost it, here is the script with instructions on how to install
and use it: [https://github.com/aleron75/jsonc](https://github.com/aleron75/jsonc)

There is a positive side effect: this script assumes you work on a separate file
with `jsonc` extension and generates the corresponding well-formed `json` file.

You can keep the `json` file under version control and ignore the `jsonc`; this
way each developer can keep his/her version of the `jsonc` file.

It's not rocket science and since I wrote the script in minutes it it likely
that it won't work for everyone.

In that case: contributions are welcome :)

Enjoy!

**EDIT**

I assume that you, like me, manually edit the `composer.json` file; that
probably, I admit, isn't a best practice.

Thus, if you use the `composer require` command that takes care of updating the
`composer.json` file, I discourage you from using the `jsonc` script.

---
Photo credits: [Josh More](https://www.flickr.com/photos/guppiecat/) - [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/2.0/)
