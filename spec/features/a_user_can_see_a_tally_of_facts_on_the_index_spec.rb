require 'spec_helper'

feature "A user can see a count of facts for a contact on the index page" do

  let(:user) { FactoryGirl.create(:user) }

  scenario "A user is on the index page and wants to see a number aount of facts for a contact" do
      contact = FactoryGirl.create(:contact)
      visit root_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
      visit new_contact_path
      fill_in "Name", with: contact.name
      click_button "Create Contact"
      visit contact_path(contact)
      click_link "Add Fact"
      fill_in "Fact", with: "OMG love this person"
      click_button "Add Fact"
      expect(page).to have_content "'OMG love this person' added successfully"
      expect(page).to have_content "OMG love this person"
      visit root_path
      expect(page).to have_content "1"
  end

end