
require 'spec_helper'

feature "User creates a new contact", %q{
  As an authenticated User
  I want to be able to add a contact
  So i can begin tracking my contacts
  } do

  # Acceptance Criteria:
  #   *I must provide a name
  #   *I can choose to enter no facts or as many facts as i want

  scenario "with valid attributes"
      # visit 'contacts/new'
      # fill_in "Name", with: "Paul Dornfeld"
      # click_on "Create Contact"
      # expect(page).to have_content "Contact \'Paul Dornfeld\' successfully created."


  scenario "with invalid attributes"
    # it "creates a contact with invalid attributes" do
    #   visit 'contacts/new'
    #   click_on "Create Contact"
      # expect(page).to have_content "Invalid entry"


end