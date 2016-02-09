require File.join(File.dirname(__FILE__), '..', '..', 'app', 'controllers', 'base_controller')

module RackFramework
  class Route
    attr_accessor :path, :controller, :method

    def initialize route_rules
      @path       = route_rules[:path]
      @controller = route_rules[:klass]
      @method     = route_rules[:method]
      require_controller
    end

    def klass
      Module.const_get(controller + "Controller")
    end

    def execute env
      klass.new(env).send(method.to_sym)
    end

    def require_controller
      require File.join(File.dirname(__FILE__), '..', '..', 'app', 'controllers', "#{controller.downcase}_controller.rb")
    end
  end
end
