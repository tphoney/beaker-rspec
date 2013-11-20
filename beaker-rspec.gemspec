# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'rbconfig'
ruby_conf = defined?(RbConfig) ? RbConfig::CONFIG : Config::CONFIG
less_than_one_nine = ruby_conf['MAJOR'].to_i == 1 && ruby_conf['MINOR'].to_i < 9

Gem::Specification.new do |s|
  s.name        = "beaker-rspec"
  s.version     = '0.0.1'
  s.authors     = ["Puppetlabs"]
  s.email       = ["sqa@puppetlabs.com"]
  s.homepage    = "https://github.com/puppetlabs/beaker-rspec"
  s.summary     = %q{RSpec bindings for beaker}
  s.description = %q{RSpec bindings for beaker}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Testing dependencies
  s.add_development_dependency 'rspec', '2.13.0'
  s.add_development_dependency 'fakefs', '0.4'
  s.add_development_dependency 'serverspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'simplecov' unless less_than_one_nine

  # Documentation dependencies
  s.add_development_dependency 'yard'
  s.add_development_dependency 'markdown' unless less_than_one_nine
  s.add_development_dependency 'thin'

  # Run time dependencies
  s.add_runtime_dependency 'beaker'
  s.add_runtime_dependency 'rspec'
end
