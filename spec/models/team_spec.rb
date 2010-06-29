require 'spec_helper'

describe Team do
  it {should belong_to(:user) }
  it {should belong_to(:league) }
  it {should have_and_belong_to_many(:players) }
  
  describe "when created" do
    before(:each) do
      @team = Factory(:valid_team)
    end

    it "should create a new instance given valid attributes" do
      @team 
    end
  end
end
