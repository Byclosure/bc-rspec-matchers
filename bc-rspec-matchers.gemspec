# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bc-rspec-matchers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Byclosure"]
  gem.email         = ["info@byclosure.com"]
  gem.description   = %q{Collection of rspec matchers to improve spec writing performance}
  gem.summary       = %q{Collection of rspec matchers to improve spec writing performance}
  gem.homepage      = "http://github.com/Byclosure/bc-rspec-matchers"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bc-rspec-matchers"
  gem.require_paths = ["lib"]
  gem.version       = Bc::RSpec::Matchers::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "ruby-debug"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "ZenTest"
end
