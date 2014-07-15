# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apress/breadcrumbs/version'

Gem::Specification.new do |spec|
  spec.name          = "apress-breadcrumbs"
  spec.version       = Apress::Breadcrumbs::VERSION
  spec.authors       = ['Merkushin']
  spec.email         = ['merkushin.m.s@gmail.com']
  spec.summary       = %q{apress-breadcrumbs}
  spec.description   = %q{apress-breadcrumbs}
  spec.homepage      = 'https://github.com/abak-press/apress-breadcrumbs'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"

  # automatic changelog builder
  spec.add_development_dependency 'changelogger'

  # a tool for uploading files to private gem repo
  spec.add_development_dependency 'multipart-post'
end
