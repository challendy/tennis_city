require 'spec_helper'

describe Team do
  it {should belong_to(:user) }
  it {should belong_to(:league) }
  # it {should have_many(:matches) }  
  it {should have_and_belong_to_many(:players) }
  
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Team.create!(@valid_attributes)
  end
end
