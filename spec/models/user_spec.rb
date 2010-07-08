require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory(:valid_user)
  end

  it "should create a new instance given valid attributes" do
    @user.should be_valid
  end
end
