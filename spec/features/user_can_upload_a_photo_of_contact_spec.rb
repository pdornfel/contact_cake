require 'spec_helper'

feature "A user can upload a photo of a new contact" do

  let(:user) { FactoryGirl.create(:user) }

  scenario "User uploads photo" do
      prev_count = Contact.count
      contact = FactoryGirl.build(:contact)
      sign_in_as(user)
      visit new_contact_path
      fill_in "Name", with: contact.name
      attach_file 'Add Photo', Rails.root.join('spec/images/valid_contact_image.jpg')
      click_button "Create Contact"
      expect(page).to have_content "'Paul Dornfeld' created successfully."
      expect(Contact.count).to eql(prev_count + 1)
      expect(Contact.last.contact_photo.url).to be_present

  end
end