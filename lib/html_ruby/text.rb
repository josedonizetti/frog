module HtmlRuby
  class Text
    def initialize(value)
      @value = value
    end

    def compile(compiler)
      compiler.append(@value)
    end
  end
end
