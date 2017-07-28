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

    context "more complete list", vcr: true do
      let(:properties) do
        Hash[{:email=>"foo2@bar.com", :firstname=>"Foo", :lastname=>"Bar", :address=>"123 Main St", :address2=>"", :city=>"Anytown", :state=>"CA", :zip=>"12345-6789", :country=>"United States", :phone=>"5554445555"}]
      end

      it "returns the expected response" do
        expect(subject.class).to eq(Hash)
        expect(subject.keys).to eq(%w[vid isNew])
      end
    end

    context "more complete list with string keys", vcr: true do
      let(:properties) do
        Hash[{"email"=>"foo3@bar.com", "firstname"=>"Foo", "lastname"=>"Bar", "address"=>"123 Main St", "address2"=>"", "city"=>"Anytown", "state"=>"CA", "zip"=>"12345-6789", "country"=>"United States", "phone"=>"5554445555"}]
      end

      it "returns the expected response" do
        expect(subject.class).to eq(Hash)
        expect(subject.keys).to eq(%w[vid isNew])
      end
    end


  end
end
