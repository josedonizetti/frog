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
        p#css_id #{i}

      - end
    }
  }
}

```
