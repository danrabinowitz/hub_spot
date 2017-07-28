# frozen_string_literal: true

module HubSpot
  module HTTPApiCalls
    module Contact
      class CreateOrUpdate
        include ::HubSpot::HTTPApiCalls::Base
        URL = "https://api.hubapi.com/contacts/v1/contact/createOrUpdate/email/%<email>s"

        def initialize(properties)
          @properties = ::HubSpot.stringify_keys(properties)
        end

        private

        attr_reader :properties

        def make_the_call
          HubSpot::HTTP.post(url: url, headers: headers, post_body: post_body)
        end

        def url
          format(URL, email: email)
        end

        def email
          properties.fetch("email")
        end

        def headers
          default_headers.merge(HubSpot::HTTP::AUTHORIZATION => auth_header_value)
        end

        def auth_header_value
          "Bearer #{HubSpot::OAuth.access_token}"
        end

        def post_body
          { "properties" => properties_array }
        end

        def properties_array
          properties.map { |k, v| { "property" => k.to_s, "value" => v } }
        end
      end
    end
  end
end
