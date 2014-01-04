require 'spec_helper'

describe Contact do

it { should validate_presence_of :name }
it { should belong_to(:user) }
it { should have_many :facts }

end
