# frozen_string_literal: true

module HubSpot
  module OAuth
    module Client
      URL = "https://api.hubapi.com/oauth/v1/token?grant_type=refresh_token&client_id=%<client_id>s&client_secret=%<client_secret>s&redirect_uri=%<redirect_uri>s&refresh_token=%<refresh_token>s" # rubocop:disable Metrics/LineLength

      class APIError < StandardError; end

      module_function

      def token_params
        expires_in, token_value = api_response.values_at("expires_in", "access_token")
        expires_at = Time.now + expires_in
        { value: token_value, expires_at: expires_at }
      end

      # TODO: Make these private module methods
      # private

      def api_response
        response = HubSpot::HTTP.post(url: url)
        if response.code.to_s != "200"
          raise APIError, "OAuth API call returned a #{response.code} != 200"
        end
        JSON.parse(response.body)
      end

      def url
        URL % url_params
      end

      def url_params
        {
          client_id: HubSpot::Configuration.client_id,
          client_secret: HubSpot::Configuration.client_secret,
          redirect_uri: HubSpot::Configuration.redirect_uri,
          refresh_token: HubSpot::Configuration.refresh_token,
        }
      end
    end
  end
end
