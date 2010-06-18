require 'spec_helper'

describe Match do
  it {should belong_to(:league) }  
  
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Match.create!(@valid_attributes)
  end
end
