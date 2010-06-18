require 'spec_helper'

describe Player do
  it {should have_and_belong_to_many(:teams) }
  
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Player.create!(@valid_attributes)
  end
end
