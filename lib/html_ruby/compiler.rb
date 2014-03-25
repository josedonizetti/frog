module HtmlRuby
  class Compiler
    def initialize
      @code = []
    end

    def append(out)
      @code.push("out.push('#{out}')")
    end

    def append_expression(out)
      @code.push("out.push(#{out})")
    end

    def append_statement(out)
      @code.push(out)
    end

    def execute(args = nil)
      to_proc.call(args)
    end

    private
    def to_proc
      proc do |args|
        variables = []

        unless args.nil?
         args.each do |k,v|
           variables.push("#{k} = \"#{v}\"")
         end
        end

        variables.push("out = []\n")

        ruby = variables.join("\n") +
              @code.join("\n") +
              "\nout.join('')"

        eval(ruby)
      end
    end
  end
end
