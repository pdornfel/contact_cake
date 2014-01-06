# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_inquiry do
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    subject "MyString"
    description "MyString"
  end
end
