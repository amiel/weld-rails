# A namespace for views
module Views
end

module Weld
  class View
    attr_reader :controller

    def initialize(controller, assigns)
      @controller = controller
      assigns.each do |name, value|
        instance_variable_set "@#{ name }", value
      end
    end
  end
end
