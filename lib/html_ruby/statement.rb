module HtmlRuby
  class Statement
    def initialize(value)
      @value = value
    end

    def compile(compiler)
      compiler.append_statement(@value)
    end
  end
end
