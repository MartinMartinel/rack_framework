module RackFramework
  class Response
    attr_accessor :status_code, :headers, :body

    def initialize
      @headers = {}
    end

    def rack_response
      [status_code, headers, [body]]
    end
  end
end
