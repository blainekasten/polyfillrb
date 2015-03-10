lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'polyfillrb/version'

Gem::Specification.new do |spec|
  spec.name          = "polyfillrb"
  spec.version       = Polyfillrb::VERSION
  spec.authors       = ["Blaine Kasten"]
  spec.email         = ["blainekasten@gmail.com"]
  spec.summary       = %q{A wrapper library for the FTLabs polyfill.io service}
  spec.description   = %q{Provides user agent specific polyfills to the browser easily in ruby}
  spec.homepage      = "https://github.com/blainekasten/polyfillrb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"

end
