require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.configure_rspec_metadata!
  config.default_cassette_options = { record: :once }
  config.filter_sensitive_data('<HUBSPOT_CLIENT_ID>') { HubSpot::Configuration.client_id }
  config.filter_sensitive_data('<HUBSPOT_CLIENT_SECRET>') { HubSpot::Configuration.client_secret }
  config.filter_sensitive_data('<HUBSPOT_REFRESH_TOKEN>') { HubSpot::Configuration.refresh_token }
  config.filter_sensitive_data('<HUBSPOT_REDIRECT_URI>') { HubSpot::Configuration.redirect_uri }
end
