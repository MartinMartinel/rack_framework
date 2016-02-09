require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rackframework', 'response')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rackframework')

class BaseController

  include RackFramework

  attr_reader :env

  def initialize env
    @env = env
  end

end
