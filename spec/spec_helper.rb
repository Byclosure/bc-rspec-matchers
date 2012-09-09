$:.push File.expand_path(File.join(File.dirname(__FILE__), "../lib"))

require "rubygems"
require "bundler"
Bundler.setup



require 'rspec'
require 'rspec/core'
require 'rspec/expectations'

RSpec.configure do |config|
end

RSpec::Matchers.define :match_to do |expected|
  match do |actual|
    actual.matches?(expected)
  end

  failure_message_for_should do |actual|
    "expected that #{actual} matches to #{expected.inspect} (using #matches?)"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} doesn't match to #{expected.inspect} (using #matches?)"
  end

  description do
    "match to #{expected.inspect}"
  end

=begin
  chain :after_matches do |actual|
  	@actual = actual
  end
=end

end