$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/../lib"))
require 'rspec'
require 'workzone'

include Workzone::Constants

def init_project(args = "")
  `thor workzone:tasks:project test_project #{args}`
end