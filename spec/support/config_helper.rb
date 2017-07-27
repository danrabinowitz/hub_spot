# frozen_string_literal: true

require "dotenv/load"

def reset_config
  HubSpot::Configuration.client_id = ENV.fetch("HUBSPOT_CLIENT_ID", "DUMMY_HUBSPOT_CLIENT_ID")
  HubSpot::Configuration.client_secret = ENV.fetch("HUBSPOT_CLIENT_SECRET", "DUMMY_HUBSPOT_CLIENT_SECRET")
  HubSpot::Configuration.refresh_token = ENV.fetch("HUBSPOT_REFRESH_TOKEN", "DUMMY_HUBSPOT_REFRESH_TOKEN")
  HubSpot::Configuration.redirect_uri = ENV.fetch("HUBSPOT_REDIRECT_URI", "DUMMY_HUBSPOT_REDIRECT_URI")
end
