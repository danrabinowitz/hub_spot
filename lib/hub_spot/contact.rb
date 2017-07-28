# frozen_string_literal: true

module HubSpot
  module Contact
    module_function

    def create_or_update(properties)
      HubSpot::HTTPApiCalls::Contact::CreateOrUpdate.new(properties).response
    end
  end
end
