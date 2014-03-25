module HtmlRuby
  class Template
    def initialize(tags)
      @tags = tags
    end

    def compile(compiler)
      @tags.each { |tag| tag.compile(compiler) }
      compiler
    end
  end
end
