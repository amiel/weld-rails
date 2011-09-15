module Weld
  class Handler
    # Default format used by Weld.
    class_attribute :default_format
    self.default_format = Mime::HTML

    def self.call(template)
      <<-RUBY
        # raise self.controller.inspect
        # raise @virtual_path.inspect
        # raise self.assigns.inspect
        # HACK:

        begin
          load(Rails.root.join('app/views', @virtual_path + ".rb"))
          class_name = self.controller.class.to_s.gsub(/Controller$/, '')
          view = Views.const_get(class_name)
          data = view.new(self.controller, self.assigns).send self.controller.action_name
        rescue LoadError # , NameError
          # Fall back to assigns
          data = @data
        end

        Weld::Compiler.context.call('run', %q{#{ template.source }}, data)
      RUBY
    end

  end
end
