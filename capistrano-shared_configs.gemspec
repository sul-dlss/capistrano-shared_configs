# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/shared_configs/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-shared_configs"
  spec.version       = Capistrano::SharedConfigs::VERSION
  spec.authors       = ["Jessie Keck", "Darren Weber"]
  spec.email         = ["jessie.keck@gmail.com"]

  spec.summary       = %q{A simple capistrano extension that provides tasks to manage DLSS Shared Configs.}
  spec.description   = %q{This gem provides capistrano tasks to pull the latest configs from the shared configs branch and update the symlinks in the shared directory.}
  spec.homepage      = "https://github.com/sul-dlss/capistrano-shared_configs"
  spec.license       = "APACHE2"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
end
