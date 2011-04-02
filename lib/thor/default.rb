require 'thor/rake_compat'

class Default < Thor
  include Thor::RakeCompat

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
end
