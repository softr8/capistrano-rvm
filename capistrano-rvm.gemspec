# -*- encoding: utf-8 -*-
require File.expand_path('../lib/capistrano-rvm/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Edwin Cruz"]
  gem.email         = ["softr8@gmail.com"]
  gem.description   = %q{Capistrano tasks to manage rvm commands}
  gem.summary       = %q{Some tasks to install rvm, ruby and bundler without pain}
  gem.homepage      = "https://github.com/softr8/capistrano-rvm"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "capistrano-rvm"
  gem.require_paths = ["lib"]
  gem.version       = Capistrano::Rvm::VERSION

  gem.add_runtime_dependency "capistrano"
end
