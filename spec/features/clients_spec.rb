require 'rails_helper'

feature 'Client management' do
	scenario 'adds a new client' do

		visit root_path
		expect{
			click_link 'New Client'
			fill_in 'Name', with: 'Example User'
			fill_in 'Email', with: 'example@user.com'
			click_button 'Create Client'
		}.to change(Client, :count).by(1)
	end

	scenario 'visits the clients index page' do

		create(:client, name: "Example User")
		visit root_path
		click_link 'Clients'
		expect(page).to have_content('Example User')
	end
end