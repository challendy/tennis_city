require 'spec_helper'

describe DraftRound do
  it { should belong_to(:draft) }
  
  
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    DraftRound.create!(@valid_attributes)
  end
end
