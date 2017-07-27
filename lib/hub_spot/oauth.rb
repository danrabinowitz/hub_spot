# frozen_string_literal: true

module HubSpot
  module OAuth
    module_function

    def access_token
      TokenStore.value
    end
  end
end
