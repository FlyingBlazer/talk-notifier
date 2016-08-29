# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'talk-notifier'
  spec.version       = '1.0.0'
  spec.authors       = ['于湛']
  spec.email         = ['yuzhan1994@gmail.com']

  spec.summary       = 'Notify exceptions using Talk.'
  spec.homepage      = 'https://github.com/FlyingBlazer/talk-notifier'
  spec.license       = 'MIT'

  gem.files          = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_dependency 'exception_notification', '~> 4.0'
  spec.add_dependency 'faraday', '~> 0.9.0'
end
