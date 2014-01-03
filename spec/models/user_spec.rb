require 'spec_helper'

describe User do

    it { should have_valid(:first_name).when("Paul", "Tony") }
    it { should_not have_valid(:first_name).when(nil, '') }

    it { should have_valid(:last_name).when("Dornfeld", "Filipov") }
    it { should_not have_valid(:last_name).when(nil, '') }

    it { should have_valid(:email).when("Paul@example.com", "Tony@aol.com") }
    it { should_not have_valid(:email).when(nil, '') }

    it "has a matching password confirmation" do
      user = User.new
      user.password = 'password'
      user.password_confirmation = 'password'
    end

    it { should have_many(:contacts) }
end
