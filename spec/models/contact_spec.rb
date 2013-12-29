require 'spec_helper'

describe Contact do

    it { should belong_to(:user).dependent(:destroy) }
    it { should_not have_valid(:name).when(nil) }
    it { should have_valid(:name).when("Paul") }





end