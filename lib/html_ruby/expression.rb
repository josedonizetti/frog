module HtmlRuby
  class Expression
    def initialize(value)
      @value = value
    end

    def compile(compiler)
      compiler.append_expression(@value)
    end

    def ==(o)
      o.class == self.class && o.state == state
    end

    protected
    def state
      @value
    end
  end
end
