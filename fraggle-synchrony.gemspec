# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fraggle-synchrony/version"

Gem::Specification.new do |s|
  s.name        = "fraggle-synchrony-spanx"
  s.version     = Fraggle::Synchrony::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steven Mohapi-Banks", "John Griffin"]
  s.email       = ["steven.mohapibanks@gmail.com", "johnog@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{An em-synchrony wrapper for fraggle}
  s.description = s.summary

  s.rubyforge_project = "fraggle-synchrony"

  s.add_dependency "fraggle-spanx"
  s.add_dependency "em-synchrony"

  s.add_development_dependency "rake", ">= 0.8.7"
  s.add_development_dependency "rspec", ">= 2.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "beefcake-spanx"
end
