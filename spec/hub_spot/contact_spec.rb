# frozen_string_literal: true

require "spec_helper"

RSpec.describe HubSpot::Contact do
  describe ".create_or_update" do
    subject { HubSpot::Contact.create_or_update(properties) }

    context "properties does not contact 'email'" do
      let(:properties) { Hash[foo: "bar"] }

      it "raises an exception" do
        expect do
          subject
        end.to raise_error(KeyError)
      end
    end

    context "properties is valid", vcr: true do
      let(:properties) { Hash[:email => "djr@DanielRabinowitz.com", "firstname" => "Dan"] }

      it "returns the expected response" do
        expect(subject.class).to eq(Hash)
        expect(subject.keys).to eq(%w[vid isNew])
      end
    end
  end
end
