---
layout:   post
title:    "Magento 2: good names reveal intent"
date:     2020-04-18 00:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/best-practices.jpg"
tags:     [magento2, best-practices, observers, plugins, service-classes]
---

## Foreword
The best names are those that **reveal the intent**.

At date, Magento 2 codebase is still full of legacy code, thus don’t always take it as a good reference.

## Observers, plugins, service classes

When naming observers, plugins, and service classes, choose a name that reveal intent.

Here follow some examples.

### Observer
**Bad**
```xml
// events.xml
<event name="store_save_after">
    <observer name="store-save-observer" instance="…/Observer/StoreSaveObserver" />
</event>
```

**Good**
```xml
// events.xml
<event name="store_save_after">
    <observer name="duplicate-store" instance="…/Observer/DuplicateStore" />
</event>
```

### Plugin
**Bad**
```xml
<!-- di.xml -->
<type name="Magento\Theme\Block\Html\Topmenu">
  <plugin name="catalogTopmenu" type="...\Plugin\Topmenu" />
</type>
```
```php
// .../Plugin/Topmenu.php
class Topmenu
{
    // ...
    public function beforeGetHtml(/* ... */)
    {
        // ...
    }
}
```

**Good**

```xml
<!-- di.xml -->
<type name="Magento\Theme\Block\Html\Topmenu">
    <plugin name="build-category-tree" type="...\Plugin\BuildCategoryTree" />
</type>
```
```php
// .../Plugin/BuildCategoryTree.php
class BuildCategoryTree
{
    // ...
    public function beforeGetHtml(/* ... */)
    {
        // ...
    }
}    
```

### Service class
**Bad**

```php
class ProductTypeList
{
    public function getProductTypes() 
    {
        // ...
    }
}
```

**Good**

    class GetProductTypes
    {
        public function execute()
        {
            // ...
        }
    }
    

## Commands and events
A **command** is something that has to be done, 
thus better use an **imperative** verb (e.g.: `doSomething`).

An **event** is something that’s happened in the past, 
thus better use a **past tense** verb (e.g.: `somethingHappened`).

If you look at how events are named in Magento 2, 
they often break this rule (e.g.: `store_save_after` is used instead of `store_saved`).

## Off-topic note
**Commits** are commands, that’s why commit messages should be written using **imperative** verbs.

Enjoy!

---
Photo credits: [Lesly Juarez](https://unsplash.com/photos/1rafrfyrsZw?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) - [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/2.0/)
