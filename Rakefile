require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :test)

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  t.pattern = "**/*_spec.rb"
  t.rspec_opts = ["--format", "documentation", "--colour"]
end

