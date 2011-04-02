$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/lib"))
require 'thor'
require 'workzone'
include Workzone

Dir.glob("#{WZ_ROOT_DIR}/lib/thor/**/*.rb").each do |file|
  require file
end
