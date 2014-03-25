module HtmlRuby
  class Tag
    def initialize(name, tags)
      @name = name
      @tags = tags
    end

    def compile(compiler)
      compiler.append("<#{@name}>")
      @tags.each {|tag| tag.compile(compiler) }
      compiler.append("</#{@name}>")
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
