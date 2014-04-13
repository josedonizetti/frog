module HtmlRuby
  class Attribute

    attr_reader :name, :value

    def initialize(name, value)
      @name = name
      @value = value
    end

    def ==(other)
      other.class == self.class && other.state == self.state
    end

    protected
    def state
      [@name, @value]
    end
  end
end
