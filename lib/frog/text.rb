module Frog
  class Text
    def initialize(value)
      @value = value
    end

    def compile(compiler)
      compiler.append(@value)
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
