# frozen_string_literal: true

require "spec_helper"

RSpec.describe HubSpot::OAuth do
  describe ".access_token", vcr: true do
    subject { HubSpot::OAuth.access_token }

    context "The current token is expired" do
      before(:each) do
        HubSpot::OAuth::Client.instance_variable_set(
          :@token,
          HubSpot::OAuth::Token.new(expires_at: Time.now - 1),
        )
      end

      it { should_not be_empty }
    end
  end
end
