# -*- encoding: utf-8 -*-
require File.expand_path('../lib/drivers_license/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jason Harrelson"]
  gem.email         = ["jason@lookforwardenterprises.com"]
  gem.description   = %q{Provides driver's license composed_of attributes.}
  gem.summary       = %q{An extension that provides driver's license composed_of attributes.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "drivers_license"
  gem.require_paths = ["lib"]
  gem.version       = DriversLicense::VERSION
end
