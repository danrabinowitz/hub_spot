require "spec_helper"

RSpec.describe HubSpot do
  it "has a version number" do
    expect(HubSpot::VERSION).not_to be nil
  end
end
