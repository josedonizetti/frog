require 'tilt'

module Tilt
  class FrogTemplate < Template
    self.default_mime_type = 'text/html'

    def prepare
      @compiler = Frog::Compiler.new
      parser = Frog::Parser.new
      parser.scan_str(data).compile(@compiler)
    end

    def evaluate(scope, locals, &block)
      locals = locals.inject({}){ |h,(k,v)| h[k.to_s] = v ; h }
      if scope.respond_to?(:to_h)
        scope  = scope.to_h.inject({}){ |h,(k,v)| h[k.to_s] = v ; h }
        locals = scope.merge(locals)
      end
      
      @compiler.execute(locals)
    end
  end

  register FrogTemplate, 'frog', 'frog'
end
