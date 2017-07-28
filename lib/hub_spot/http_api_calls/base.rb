# frozen_string_literal: true

module HubSpot
  module HTTPApiCalls
    module Base
      def response
        JSON.parse(raw_response.body)
      end

      def raw_response
        make_the_call
      end

      def default_headers
        HubSpot::HTTP::DEFAULT_HEADERS
      end
    end
  end
end
