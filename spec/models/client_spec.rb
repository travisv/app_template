require 'rails_helper'
describe Client do
	it "is valid with a name and email" do
		client = Client.new(name: 'Example User', email: 'user@example.com')
		client.valid?
		expect(client.errors)
	end
end
