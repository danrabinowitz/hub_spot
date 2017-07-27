# frozen_string_literal: true

require "spec_helper"

RSpec.describe HubSpot::OAuth::TokenStore do
  describe ".token" do
    subject { HubSpot::OAuth::TokenStore.token }

    context "a token exists and is not expired" do
      before(:each) do
        HubSpot::OAuth::TokenStore.instance_variable_set(
          :@token,
          HubSpot::OAuth::Token.new(value: "value", expires_at: Time.now + 1000),
        )
      end

      it "does not make an HTTP call" do
        expect(HubSpot::HTTP).not_to receive(:post)
        subject
      end
    end

    context "the client id is invalid", vcr: true do
      before(:each) do
        HubSpot::Configuration.client_id = "INVALID_HUBSPOT_CLIENT_ID"
        HubSpot::OAuth::TokenStore.expire
      end

      it "raises an exception" do
        expect do
          subject
        end.to raise_error(HubSpot::OAuth::Client::APIError)
      end
    end
  end
end
