# Capistrano::Rvm

Capistrano tasks to work with RVM

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-rvm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-rvm

## Usage

Add this after you define rvm_ruby_string:

    require 'capistrano-rvm'

This gem includes the following tasks:

    cap rvm                      # Installs rvm, ruby and bundler
    cap rvm:create_gemset        # Creates the gemset to use
    cap rvm:default_ruby         # sets as default current ruby version
    cap rvm:install              # Installs rvm
    cap rvm:install_bundler      # Install bundler gem
    cap rvm:install_ruby         # Installs ruby version specified in rvm_ruby_st...


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
