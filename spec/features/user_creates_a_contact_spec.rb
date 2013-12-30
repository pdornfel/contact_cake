require 'spec_helper'

feature "User creates a new contact" do

  # Acceptance Criteria:
  #   *I must provide a name
  #   *I can choose to enter no facts or as many facts as i want

  context "with valid attributes" do
    it "creates a contact with valid attributes" do
      visit 'contacts/new'
      fill_in "Name", with: "Paul Dornfeld"
      click_on "Create Contact"

      expect(page).to have_content "Contact was successfully created"
    end
  end

  context "with invalid attributes" do
  end


end