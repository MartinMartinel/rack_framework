require_relative 'route'

module RackFramework
  class Router
    attr_reader :routes

    def initialize
      @routes = Hash.new { |hash, key| hash[key] = []}
    end

    def config &block
      instance_eval &block
    end

    def get path, options = {}
      @routes[:get] << get_path_controller_and_action(path, options[:to])
    end

    def route_for env
      path   = env["PATH_INFO"]
      method = env["REQUEST_METHOD"].downcase.to_sym
      route_array = routes[method].find do |route|
        case route[:path]
          when String
            path == route[:path]
          when Regexp
            path =~ route[:path]
        end
      end
      return Route.new(route_array) if route_array
      return nil
    end

    private

    def get_path_controller_and_action path, string
      klass, method = string.split("#")
      {:path => path, :klass => klass, :method => method}
    end
  end
end
