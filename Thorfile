$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/lib"))
require 'thor'
require 'workzone'
include Workzone::Constants

Dir.glob("#{WZ_ROOT_DIR}/lib/workzone/tasks/**/*.rb").each do |file|
  require file
end
