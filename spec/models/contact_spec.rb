require 'spec_helper'

describe Contact do

    it { should belong_to(:user).dependent(:destroy) }




end