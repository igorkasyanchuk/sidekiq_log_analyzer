# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq_log_analyser/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq_log_analyser"
  spec.version       = SidekiqLogAnalyser::VERSION
  spec.authors       = ["Igor Kasyanchuk"]
  spec.email         = ["igorkasyanchuk@gmail.com"]

  spec.summary       = %q{Simple sidekiq log analyzer.}
  spec.description   = %q{Simple sidekiq log analyzer.}
  spec.homepage      = "https://github.com/igorkasyanchuk@gmail"
  spec.license       = "MIT"

  spec.files         = Dir["{lib,spec,bin}/**/*", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "Rakefile", "README.md", "bin/sidekiq_log_analyser"]

  spec.executables   = ["sidekiq_log_analyser"]
  spec.bindir        = "bin"
  spec.require_paths = ["lib", "bin"]

  spec.add_dependency "groupdate"
  spec.add_dependency "colorize"
  spec.add_dependency "terminal-table"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "terminal-table"
end
