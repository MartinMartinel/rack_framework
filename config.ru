require 'bundler'
Bundler.require

require File.join(File.dirname(__FILE__), 'lib','rackframework')
Dir[File.join(File.dirname(__FILE__), 'lib','rackframework/*.rb')].each {|file| require file}

MyApp = RackFramework::RequestController.new

require File.join(File.dirname(__FILE__), 'config', 'routes')

run MyApp
