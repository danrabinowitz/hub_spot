# frozen_string_literal: true

def expire_token
  HubSpot::OAuth::TokenStore.expire
end
