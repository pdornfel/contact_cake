require 'spec_helper'

feature 'a new user can sign up =>' do

  # As an new user
  # I want to be able to sign up
  # So I can begin to to use the site

  scenario "A new user enters in valid and required information" do
    visit new_user_registration_path
    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Dornfeld"
    fill_in "Email", with: "pdorfel@gmail.com"
    fill_in "user_password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Sign Up"

    expect(page).to have_content("Welcome to Contact Cake! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end

  scenario "a new user DOES NOT supply required information"

  scenario "password confirmation does not match"


end