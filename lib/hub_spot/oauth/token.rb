# frozen_string_literal: true

module HubSpot
  module OAuth
    class Token
      class ExpiredError < StandardError; end

      def initialize(value: nil, expires_at:)
        @value = value
        @expires_at = expires_at
      end

      attr_reader :expires_at

      def value
        raise ExpiredError if expired?
        @value
      end

      def expired?
        Time.now > expires_at
      end
    end
  end
end
