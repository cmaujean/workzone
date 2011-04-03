require 'thor/rake_compat'

class Default < Thor
  include Thor::RakeCompat

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |sp|
    sp.rspec_opts = "-O spec/spec.opts"
  end
end
