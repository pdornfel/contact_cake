require 'spec_helper'

describe Contact do

    it { should belong_to(:user).dependent(:destroy) }
    it { should_not have_valid(:name).when(nil) }
    it { should validate_uniqueness_of(:name) }
    it { should have_valid(:name).when("Paul") }

    it { should have_many(:facts) }






end