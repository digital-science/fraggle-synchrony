# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fraggle-synchrony/version"

Gem::Specification.new do |s|
  s.name        = "fraggle-synchrony"
  s.version     = Fraggle::Synchrony::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steven Mohapi-Banks"]
  s.email       = ["steven.mohapibanks@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{An em-synchrony wrapper for fraggle}
  s.description = s.summary

  s.rubyforge_project = "fraggle-synchrony"

  s.add_dependency "fraggle"
  s.add_dependency "em-synchrony"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
