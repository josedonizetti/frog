#HtmlRuby

Template language which compiles to html. Support ruby code.
Implemented with raac, and rexical.

#Example
```
html {
  head {
    title "My App"
  }

  body {
    h1 "My App"

    section {
      "This is cool"

      // Ruby code
      {% for i in 0..2 %}

        // Expressions
        p {{ i }}

      {% end %}
    }
  }
}

```
