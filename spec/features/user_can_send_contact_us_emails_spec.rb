require 'spec_helper'

feature "A registered user can send Contact Us emails", %q{
    As a site visitor
    I want to contact the site's staff
    So that I can ask questions or make comments about the site
  } do

      # I must specify a valid email address
      # I must specify a subject
      # I must specify a description
      # I must specify a first name
      # I must specify a last name

  scenario "From the homepage the user clicks contact us and sends a message" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Contact Us"
    fill_in "Email", with: user.email
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Subject", with: "Just saying hello"
    fill_in "Description", with: "Your site is awesome"
    click_on "Submit"
    expect(page).to have_content "Your message has been sent"
  end

  scenario "It actually sends the message" do
    prev_mail_count = ActionMailer::Base.deliveries.count
    FactoryGirl.build(:user_inquiry).submit
    expect(ActionMailer::Base.deliveries.count).to eql(prev_mail_count + 1)
  end
end