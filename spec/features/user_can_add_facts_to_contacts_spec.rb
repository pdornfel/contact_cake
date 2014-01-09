require 'spec_helper'

feature "A user can add facts to a contact", %Q{
    As a registered user
    I can add facts to my existing contacts
    So i can remember their names
  } do

    #I can can add a facts to a contact
    #I can optionally add as many facts as I like

  let(:user) { FactoryGirl.create(:user) }

  scenario "A user adds a fact to an existing user" do
      contact = FactoryGirl.create(:contact)
      sign_in_as(user)
      visit new_contact_path
      fill_in "Name", with: contact.name
      click_button "Create Contact"
      visit contact_path(contact)
      click_link "Add Fact"
      fill_in "Fact", with: "OMG love this person"
      click_button "Create Fact"
      expect(page).to have_content "'OMG love this person' added successfully"
      expect(page).to have_content "OMG love this person"
    end

end