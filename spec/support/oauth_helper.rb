# frozen_string_literal: true

def expire_token
  HubSpot::OAuth::Client.instance_variable_set(
    :@token,
    HubSpot::OAuth::Token.new(expires_at: Time.now - 1),
  )
end
