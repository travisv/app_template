require 'rails_helper'
describe Client do
	it "is valid with a name and email" do
		client = build(:client)
		client.valid?
		expect(client.errors)
	end
	it "is invalid without a name" do
		client = build(:client, name: nil)
		client.valid?
		expect(client.errors[:name]).to include("can't be blank")
	end
	it "is invalid without an email" do
		client = build(:client, email: nil)
		client.valid?
		expect(client.errors[:email]).to include("can't be blank")
	end
	it "is invalid unless email is unique" do
		client = create(:client, email: 'test@example.com')
		duplicate = build(:client, email: 'test@example.com')
		duplicate.valid?
		expect(duplicate.errors[:email]).to include("has already been taken")
	end
end
 