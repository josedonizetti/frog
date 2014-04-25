module Frog
  class Template
    def initialize(tags)
      @tags = tags
    end

    def compile(compiler)
      @tags.each { |tag| tag.compile(compiler) }
      compiler
    end

    def ==(o)
      o.class == self.class && o.state == state
    end

    protected
    def state
      [@name] + @tags
    end
  end
end
