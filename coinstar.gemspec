# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'coinstar'
  spec.version       = '0.0.5'
  spec.authors       = ['Brooks Swinnerton']
  spec.email         = ['bswinnerton@gmail.com']
  spec.description   = %q{GA Apprentice Code Challenge}
  spec.summary       = %q{A gem to generate the correct value of currency in coins and vice versa}
  spec.homepage      = 'https://github.com/bswinnerton/coinstar'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'coveralls'

  spec.add_runtime_dependency 'activesupport'
end
