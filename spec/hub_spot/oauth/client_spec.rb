# frozen_string_literal: true

require "spec_helper"

RSpec.describe HubSpot::OAuth::Client do
  describe ".url" do
    it "raises a NoMethodError because the method is private" do
      expect do
        HubSpot::OAuth::Client.url
      end.to raise_error(NoMethodError)
    end
  end
end
