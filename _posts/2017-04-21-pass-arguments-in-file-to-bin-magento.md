---
layout:   post
title:    "Pass arguments in file to bin/magento"
date:     2017-04-21 00:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/2017-04-21-pass-arguments-in-file-to-bin-magento.jpg"
tags:     [magento2, cli]
---
**TL;DR:** to pass arguments in file to `bin/magento` use the `xargs -a` command.

---
During a tech talk at Magento Imagine 2017 someone asked if it was possible to extend the `bin/magento` tool to get arguments from file.

Actually it isn't necessary: \*nix shells already give us the opportunity to pass a file containing command arguments through the `xargs -a` command.

For example, if we create an `install.args` file with the following content:

```
setup:install --admin-firstname="Admin" --admin-lastname="User" --admin-email="mageadmin@example.com" --admin-user="admin" --admin-password="password" --db-host="localhost" --db-name="magento" --db-user="magento" --db-password="password" --backend-frontname="admin"
```   

we can install Magento 2 by executing the following command:

```
xargs -a install.args bin/magento
```

Quick and handy!

---
Photo credits: [Tim Gouw](https://stocksnap.io/author/5299) - [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/2.0/)
