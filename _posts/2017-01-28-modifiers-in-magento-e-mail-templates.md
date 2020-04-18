---
layout:   post
title:    "Modifiers in Magento e-mail templates"
date:     2017-01-28 00:00:00+0000
author:   "Alessandro Ronchi"
header-img: "img/2017-01-28-modifiers-in-magento-e-mail-templates.jpg"
tags:     [magento, email]
---
**TL;DR:** to apply URL-encoding to a variable in an e-mail template use the following syntax:

{% raw %}
`{{var order.customer_email|escape:url}}`
{% endraw %}

The `|escape:url` part is a so called **modifier**.

---

It can seem incredible but after many years working with Magento I never needed to use modifiers in e-mail templates.

It's not unlikely you never heard about this functionality because there aren't any usage examples in Magento's email templates;
furthermore searching in Google didn't produce any useful result for me.

To understand the modifier syntax and discover how modifiers work let's look at the following methods from `Mage_Core_Model_Email_Template_Filter` class:

    public function varDirective($construction)
    {
        if (count($this->_templateVars)==0) {
            // If template preprocessing
            return $construction[0];
        }

        $parts = explode('|', $construction[2], 2);
        if (2 === count($parts)) {
            list($variableName, $modifiersString) = $parts;
            return $this->_amplifyModifiers($this->_getVariable($variableName, ''), $modifiersString);
        }
        return $this->_getVariable($construction[2], '');
    }

    protected function _amplifyModifiers($value, $modifiers)
    {
        Mage::log(print_r($modifiers, 1), null, 'filter.log', true);
        foreach (explode('|', $modifiers) as $part) {
            if (empty($part)) {
                continue;
            }
            $params   = explode(':', $part);
            Mage::log(print_r($params, 1), null, 'filter.log', true);
            $modifier = array_shift($params);
            if (isset($this->_modifiers[$modifier])) {
                $callback = $this->_modifiers[$modifier];
                if (!$callback) {
                    $callback = $modifier;
                }
                array_unshift($params, $value);
                $value = call_user_func_array($callback, $params);
            }
        }
        return $value;
    }

The `varDirective()` method splits the `var` value on pipe `|` char and, in case, calls the `_amplifyModifiers()` method.

The `_amplifyModifiers()` splits `$value` on colon `:` and applies the proper modifier to the value.

The code responsible for applying the `escape` modifier is shown below:

    public function modifierEscape($value, $type = 'html')
    {
        switch ($type) {
            case 'html':
                return htmlspecialchars($value, ENT_QUOTES);

            case 'htmlentities':
                return htmlentities($value, ENT_QUOTES);

            case 'url':
                return rawurlencode($value);
        }
        return $value;
    }

As we can see we can apply one of the following transformations to variable values in e-mail template:

* `html` to convert special characters to HTML entities
* `htmlentities` to convert all applicable characters to HTML entities
* `url` to URL-encode the value

The only other modifier that can be used out of the box is the `nl2br` that is used to insert HTML line breaks before all new line characters in a string.

Note: in **Magento 2** there is a `\Magento\Framework\Filter\Template\Filter` class that seems very similar to the one of Magento 1; even if I didn't give it a try I suppose the same syntax applies to Magento 2 e-mail templates as well.

Enjoy!

---
Photo credits: [Max Wheeler](https://www.flickr.com/photos/makenosound/) - [Creative Commons license](https://creativecommons.org/licenses/by-nc-nd/2.0/)
