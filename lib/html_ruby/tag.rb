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
  end
end
