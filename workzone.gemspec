# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "workzone/version"

Gem::Specification.new do |s|
  s.name        = "workzone"
  s.version     = Workzone::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Christopher Maujean"]
  s.email       = ["cmaujean@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A set of thor tasks for the managment of coding projects, tied together by a binary.}
  s.description = %q{A thor based working area for easily creating and destroying project directories with some default things like a .rvmrc and clean gemset, git with a .gitignore, an initial commit, and other similar project related features.}

  s.rubyforge_project = "workzone"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
