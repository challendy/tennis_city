require 'spec_helper'

describe Draft do
  it {should belong_to(:league) }  
  
  
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Draft.create!(@valid_attributes)
  end
end
