# frozen_string_literal: true

module HubSpot
  module OAuth
    module TokenStore
      EXPIRED_TOKEN = Token.new(expires_at: Time.now - 1).freeze
      @token = EXPIRED_TOKEN

      module_function

      def value
        token.value
      end

      def expire
        @token = EXPIRED_TOKEN
      end

      def token
        if @token.expired?
          @token = Token.new(Client.token_params)
        else
          @token
        end
      end
    end
  end
end
