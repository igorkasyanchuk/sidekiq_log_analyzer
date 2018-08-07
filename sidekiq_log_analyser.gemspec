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

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
