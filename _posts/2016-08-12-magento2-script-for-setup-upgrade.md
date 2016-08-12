---
layout:   post
title:    "Magento 2 script for setup upgrade"
date:     2016-08-12 00:00:00
author:   "Alessandro Ronchi"
header-img: "img/2016-08-12-magento2-script-for-setup-upgrade.jpg"
tags:     [magento2, tools]
---
To determine whether your current **Magento 2** instance needs **upgrade scripts** to run you can use the following CLI command:

    $ bin/magento setup:db:status

The output can either be something like this (if upgrade is needed):

    The module code base doesn't match the DB schema and data.

or like this (if no upgrade is needed):

    All modules are up to date.    

Unfortunately, at date, the Magento 2 CLI doesn't return **different exit codes** in case of different outcomes, that's something that can be useful especially if you use some **CI or deploy tools**.

Thus I wrote a simple **bash script** that converts different text outputs in different exit codes:

    #!/bin/bash
    # use --no-ansi to avoid color characters
    message=$(bin/magento setup:db:status --no-ansi)
    if [[ ${message:0:3} == "All" ]];
    then
      exit 0 # 0 not required being default exit code; used for clarity
    else
      exit 1
    fi

You can also download it [from here](https://gist.github.com/aleron75/5b35f8b670ad24bffbca48c0370135ec).

Enjoy!

---
Photo credits: [Christiaan Colen](https://www.flickr.com/photos/132889348@N07/) - [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/2.0/)
