# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'frog/version'

Gem::Specification.new do |spec|
  spec.name          = "frog"
  spec.version       = Frog::VERSION
  spec.authors       = ["Jose Donizetti"]
  spec.email         = ["jdbjunior@gmail.com"]
  spec.summary       = %q{Simple HTML template language.}
  spec.description   = %q{Simple HTML template language.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "racc"
  spec.add_dependency "rexical"
  spec.add_dependency "tilt"

  spec.add_development_dependency "bundler", "~> 1.6.0.rc2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
