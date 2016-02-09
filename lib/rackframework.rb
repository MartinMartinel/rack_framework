require File.join(File.dirname(__FILE__), 'rackframework', 'router')

module RackFramework
  class RequestController
    attr_reader :router

    def initialize
      @router = Router.new
    end

    def call(env)
      route = router.route_for(env)
      if route
        response = route.execute(env)
        return response.rack_response
      else
        return [404, {}, []]
      end
    end
  end
end
