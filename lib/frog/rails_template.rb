module Frog

  class RailsTemplate
    def handles_encoding?; false; end

    def initialize(view)
      @view = view
      @compiler = Frog::Compiler.new
      @parser = Frog::Parser.new
    end

    def self.call(template)
      "Frog::RailsTemplate.new(self).render(#{template.source.inspect}, local_assigns)"
    end

    def render(template, local_assigns = {})
      @view.controller.headers["Content-Type"] ||= 'text/html; charset=utf-8'
      assigns = @view.assigns
      assigns.merge!(local_assigns.stringify_keys)
      @parser.scan_str(template).compile(@compiler)
      @compiler.execute(assigns)
    end

    def compilable?
      false
    end
  end
end

ActionView::Template.register_template_handler(:frog, Frog::RailsTemplate)
