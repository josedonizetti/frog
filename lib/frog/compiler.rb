module Frog
  class Compiler
    def initialize
      @code = []
    end

    def append(out)
      @code.push("out.push(\"#{out}\")")
    end

    def append_expression(out)
      @code.push("out.push(#{out})")
    end

    def append_statement(out)
      @code.push(out)
    end

    def execute(locals = {})
      to_proc(locals.keys).call(locals)
    end

    def to_proc(local_names)
      eval <<-EOS
        proc do |locals|
          out = []

          #{local_names.map { |name| "#{name} = locals[:#{name}]" }.join("\n")}

          #{@code.join("\n")}

          out.join('')
        end
      EOS
    end
  end
end
