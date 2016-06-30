# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'corelogic/version'

Gem::Specification.new do |gem|
  gem.name          = "corelogic"
  gem.version       = Corelogic::VERSION
  gem.authors       = ["Shuntyard"]
  gem.email         = ["info@shuntyard.co.za"]
  gem.description   = %q{Property info Au}
  gem.summary       = %q{Property info Au, pricing etc}
  gem.license       = 'MIT'

  #Dependencies
  gem.add_dependency "rest-client", '~> 1.8'
  gem.add_development_dependency "activerecord", "~> 4.0.0"

  #Dev dependencies
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "bundler", "~> 1.11"
  gem.add_development_dependency "rspec-rails", '~> 3.0.0.beta1'
  gem.add_development_dependency 'rails', '~> 4.0.0'

  # gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
