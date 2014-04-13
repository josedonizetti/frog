module HtmlRuby
  class Tag
    def initialize(name, attributes, tags)
      @name = name
      @attributes = attributes
      @tags = tags
    end

    def compile(compiler)
      attributes = compile_attributes

      if attributes.empty?
        compiler.append("<#{@name}>")
      else
        compiler.append("<#{@name} #{attributes}>")
      end

      @tags.each {|tag| tag.compile(compiler) }
      compiler.append("</#{@name}>")
    end

    def ==(o)
      o.class == self.class && o.state == state
    end

    protected
    def state
      [@name] + @attributes + @tags
    end

    private
    def compile_attributes
      attributes_hash = {}

      @attributes.each do |attr|
        if attributes_hash[attr.name]
          attributes_hash[attr.name] << attr.value
        else
          attributes_hash[attr.name] = [attr.value]
        end
      end

      attributes_string = ""
      attributes_hash.each do |key, value|
        attributes_string += "#{key}='#{value.join(" ")}' "
      end

      attributes_string.strip
    end
  end
end
