module HtmlRuby
  class Expression
    def initialize(value)
      @value = value
    end

    def compile(compiler)
      compiler.append_expression(@value)
    end
  end
end
