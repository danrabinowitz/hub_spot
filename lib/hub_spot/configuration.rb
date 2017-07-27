module HubSpot
  class Configuration
    ATTRIBUTES = %i(api_host client_id client_secret redirect_uri refresh_token logger).freeze

    class << self
      attr_accessor(*ATTRIBUTES)

      def client_id=(value)
        raise ArgumentError, "client_id cannot be blank" if value.nil? || value.empty?
        @client_id = value
      end

      def client_secret=(value)
        raise ArgumentError, "client_secret cannot be blank" if value.nil? || value.empty?
        @client_secret = value
      end

      def redirect_uri=(value)
        raise ArgumentError, "redirect_uri cannot be blank" if value.nil? || value.empty?
        @redirect_uri = value
      end

      def refresh_token=(value)
        raise ArgumentError, "refresh_token cannot be blank" if value.nil? || value.empty?
        @refresh_token = value
      end
    end
  end
end
