require 'spec_helper'

describe League do
  it {should have_many(:teams) }  
  it {should have_many(:matches) }
  it {should have_one(:draft) }  
  it {should have_and_belong_to_many(:users) }  

  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    League.create!(@valid_attributes)
  end
end
