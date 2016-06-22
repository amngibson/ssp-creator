# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ssp/creator/version'

Gem::Specification.new do |spec|
  spec.name          = "ssp-creator"
  spec.version       = Ssp::Creator::VERSION
  spec.authors       = ["Nathan Gibson"]
  spec.email         = ["amngibson@gmail.com"]

  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #spec.bindir        = "exe"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = %w(ssp)
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "< 11.0"
  spec.add_development_dependency "rspec", "3.0.0"
end
