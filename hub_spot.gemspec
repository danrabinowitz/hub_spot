# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hub_spot/version"

Gem::Specification.new do |spec| # rubocop:disable Metrics/BlockLength
  spec.name          = "hub_spot"
  spec.version       = HubSpot::VERSION
  spec.authors       = ["Dan Rabinowitz"]
  spec.email         = ["djr@DanielRabinowitz.com"]

  spec.summary       = "Omakase ruby API for HubSpot"
  spec.description   = "Omakase ruby API for HubSpot"
  spec.homepage      = "https://github.com/danrabinowitz/hub_spot"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-console"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rubocop"
end
