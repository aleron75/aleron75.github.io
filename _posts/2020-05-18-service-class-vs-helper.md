---
layout:   post
title:    "Magento 2: Service class vs Helper"
date:     2020-05-18 05:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/best-practices.jpg"
tags:     [magento2, best-practices, helpers, service-classes]
---

## Foreword
In Magento 2, implementing service classes should take the place of old helper classes.

The reason is simple: **helpers are unspecialized classes** that tend to have **too 
many responsibilities**. For this reason, helpers also tend to have a name that 
doesn’t [reveal a clear intent]({% post_url 2020-04-18-good-names-reveal-intent %}).

## What's a service class
A service class is a class with a **single clear responsibility**. 
Usually, we can achieve this by implementing a single public method, typically named `execute()`.

Some examples taken from Magento codebase are:
- `\Magento\InventorySales\Model\GetSkuFromOrderItem`
- `\Magento\InventorySales\Model\GetStockBySalesChannel`
- `\Magento\InventoryConfiguration\Model\IsSourceItemManagementAllowedForProductType`

## What about the popular config helpers?
One of the typical implementation scenarios for helpers, especially in Magento 1 and in Magento 2 legacy code, 
is the helper used to retrieve configuration values.

When we need to access configuration values, better inject `\Magento\Framework\App\Config\ScopeConfigInterface`, 
which gives access to configuration values. 

For convenience and reusability, we can declare configuration paths as constants into service interfaces.

We can also implement configuration service classes, like `IsSourceItemManagementAllowedForProductType` example, 
for a couple of reasons:

- to expose a specific configuration which is subject to additional logic, or 
- to make it easier to customize, e.g., through a plugin.

Enjoy!

---
Photo credits: [Lesly Juarez](https://unsplash.com/photos/1rafrfyrsZw?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) - [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/2.0/)
