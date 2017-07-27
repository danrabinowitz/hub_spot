module HubSpot
  module OAuth
    module_function

    def access_token
      Client.token.value
    end
  end
end
