require 'spec_helper'

feature 'a new user can sign up =>' do

  # As an new user
  # I want to be able to sign up
  # So I can begin to to use the site

  scenario "A new user enters in valid and required information" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "Password Confirmation", with: user.password_confirmation
    click_button "Sign Up"

    expect(page).to have_content("Welcome to Contact Cake! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end

  scenario "a new user DOES NOT supply required information" do
    visit new_user_registration_path
    click_button "Sign Up"
    expect(page).to have_content("Please review the problems below:")
  end

  scenario "password confirmation does not match" do
    visit new_user_registration_path
    fill_in "First Name", with: "Paul"
    fill_in "Last Name", with: "Dornfeld"
    fill_in "Email", with: "pdorfel@gmail.com"
    fill_in "user_password", with: "123456789"
    fill_in "Password Confirmation", with: "password"
    click_button "Sign Up"
    expect(page).to have_content("doesn't match Password")
  end

  scenario "When a user signs out after being signed in user is taken to new registartion page" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "Password Confirmation", with: user.password
    click_button "Sign Up"

    expect(page).to have_content("Welcome to Contact Cake! You have signed up successfully.")
    click_link "Sign Out"

    expect(page).to have_content "Signed out successfully"
    expect(page).to have_content "Sign in"
    expect(page).to_not have_content "Sign Out"
  end


end