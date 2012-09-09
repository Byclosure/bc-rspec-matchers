# Bc::Rspec::Matchers

This projects aims to be an open source effort to collect all the RSpec custom matchers & macros used across Byclosure projects.

## Installation

Add this line to your application's Gemfile:

    gem 'bc-rspec-matchers', "~> 0.0.3"

And then execute:

    $ bundle install

Go to your RSpec configuration files and add:

    RSpec.configure do |c|
      c.include Bc::RSpec::Matchers
    end

## Development & Improvment of bc-rspec-matchers

    $ bundle


To run specs in autotest enable just run: `bundle exec autotest`.

To run specs, just run: `bundle exec rake spec`


## Add new gem dependencies

*Atention:* Do not use Gemfile for that, Gemfile will automatically be created for you.

Steps:

1. Go to bc-rspec-matchers.gem
2. See and use the `gem.add_development_dependency` (that works the same way as Gemfile depencies)
3. run `bundle`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Notes to Manage and improve this gem

See: http://railscasts.com/episodes/245-new-gem-with-bundler?view=asciicast

### Update & Release

1. Update gem version: `lib/bc-rspec-matchers/version.rb`
2. Run `bundle exec rake release`

# Relevant blog posts
 * http://eggsonbread.com/2010/03/28/my-rspec-best-practices-and-tips/
 * http://benscheirman.com/2011/05/dry-up-your-rspec-files-with-subject-let-blocks
 * http://solnic.eu/2011/01/14/custom-rspec-2-matchers.html (chains)