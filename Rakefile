#!/usr/bin/env rake
require "bundler/gem_tasks"


require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = File.read(".rspec").gsub("\n", " ")
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = "./spec/**/*_spec.rb"
  spec.rcov = true
end