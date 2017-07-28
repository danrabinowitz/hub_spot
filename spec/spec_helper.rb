# frozen_string_literal: true

# Hack to remove VERSION (which is loaded/required via Gemfile -> *.gemspec) before simplecov
# Without this, simplecov reports the VERSION is not covered by specs.
HubSpot.send(:remove_const, "VERSION") if defined?(HubSpot)
$LOADED_FEATURES.delete_if { |s| s.include?("hub_spot/version") }

require "simplecov"
require "bundler/setup"
require "byebug"

require "hub_spot"
require "support/config_helper"
require "support/oauth_helper"
require "support/vcr_helper"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    reset_config
    expire_token
  end
end
