# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'home_of_phone/version'

Gem::Specification.new do |spec|
  spec.name          = "home_of_phone"
  spec.version       = HomeOfPhone::VERSION
  spec.authors       = ["Dave"]
  spec.email         = ["dave.schwantes@gmail.com"]

  spec.summary       = %q{Test how similar two words sound to each other.}
  spec.description   = %q{Test how similar two words sound to each other.}
  spec.homepage      = "https://github.com/dorkrawk/home_of_phone"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
