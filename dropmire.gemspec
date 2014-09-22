# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dropmire/version'

Gem::Specification.new do |spec|
  spec.name          = "dropmire"
  spec.version       = Dropmire::VERSION
  spec.authors       = ["Connor Jacobsen"]
  spec.email         = ["jacobsen.connor@gmail.com"]
  spec.summary       = %q{A simple way to collect data from US driver's licenses.}
  spec.description   = %q{A simple way to collect data from US driver's licenses with a card reader.}
  spec.homepage      = ""
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
