#Frog

Template language which compiles to html. Support ruby code.
Implemented with raac, and rexical.

#Example
```
html {
  head {
    title "My App"
  }

  body.css_class {
    h1.css_class "My App"

    section#id.class1.class2 {
      "This is cool"

      //Ruby code
      - for i in 0..2

        //Expressions
        p#css_id(style="color:blue") #{i}

      - end
    }
  }
}

```

LICENSE
-------

Tilt is Copyright (c) 2014 [Jose Donizetti](https://github.com/josedonizetti) and
distributed under the MIT license. See the `LICENSE` file for more info.
