require "spec_helper"

RSpec.describe HubSpot::OAuth::Client do
  describe ".token" do
    subject { HubSpot::OAuth::Client.token }

    context "a token exists and is not expired" do
      before(:each) do
        HubSpot::OAuth::Client.instance_variable_set(:@token, HubSpot::OAuth::Token.new(value: 'value', expires_at: Time.now + 1000))
      end

      it "does not make an HTTP call" do
        expect(HubSpot::HTTP).not_to receive(:post)
        subject
      end
    end
  end
end
