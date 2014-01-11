require 'spec_helper'

feature "A user can edit or delete facts" do

  let(:user) { FactoryGirl.create(:user) }

  scenario "User edits a fact" do
      contact = FactoryGirl.create(:contact)
      sign_in_as(user)
      visit contact_path(contact)
      click_link "Add Fact"
      fill_in "Fact", with: "the coolest"
      click_button "Create Fact"
      click_link "Edit Contact or Facts"
      click_link "Edit Fact"
      fill_in "Fact", with: "blah blah"
      click_button "Update Fact"
      expect(page).to have_content "'blah blah' updated successfully"
  end
end