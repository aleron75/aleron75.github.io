---
layout:   post
title:    "Magento 2: pluginize only public code"
date:     2018-04-13 00:00:00
author:   "Alessandro Ronchi"
header-img: "img/best-practices.jpg"
tags:     [magento2, best-practices, plugins]
---
This is the first of hopefully many articles on **Magento 2 best practices** I'm learning along the way.

This very first post is about **plugins**.

We know from the [official documentation](http://devdocs.magento.com/guides/v2.2/extension-dev-guide/plugins.html) that a plugin is a way to extend Magento core, that is, a class that **modifies the behavior of another public class**, with some limitations.

I'd like to focus on one that is more a warm recommendation than a limitation, that is: define **plugins** only on **public code**.

What is public code? Public code is every PHP interface/class marked with `@api` annotation (read more [here](http://devdocs.magento.com/guides/v2.2/extension-dev-guide/versioning/codebase-changes.html)).

Relying only on public code guarantees that in case of **patch updates**, which are more frequent than minor or major updates, the functionality based on **our plugin won't break**.

Indeed, let's remember that **private code** is likely destined to be **changed** or even **removed** over time.

I know that sometimes it seeems unavoidable to rely on private code, but don't forget that Magento 2 is **open source**: if we don't find a **proper public extension point**, we now have the opportunity to **implement it** and have it **merged** into Magento core.

Enjoy!

---
Photo credits: [Lesly Juarez](https://unsplash.com/photos/1rafrfyrsZw?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) - [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/2.0/)
