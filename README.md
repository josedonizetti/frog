#Frog

Template language which compiles to html. Support ruby code.
Implemented with raac, and rexical.

##Syntax
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

## Installation

**Frog**'s installation is pretty standard:

```
$ gem install frog
```

If you'd rather install Frog using `bundler`:

```
gem 'frog'
```

## Basic Usage

Running `frog` passing a template to compile it:

```
$ frog path/to/template.frog
```

[Atom Support.](https://github.com/josedonizetti/atom-language-frog)

## Contributing

Want to contribute? Great!

1. Fork it.
2. Create a branch (`git checkout -b new_feature`)
3. Commit your changes (`git commit -am "Add new feature"`)
4. Push to the branch (`git push origin new_feature`)
5. Open a [Pull Request][1]


##LICENSE

Frog is Copyright (c) 2014 [Jose Donizetti](https://github.com/josedonizetti) and
distributed under the MIT license. See the `LICENSE` file for more info.

##Credits

Frog was born inside the [Great Club of Code](http://www.greatcodeclub.com/).
