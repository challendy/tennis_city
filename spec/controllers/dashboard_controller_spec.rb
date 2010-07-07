require 'spec_helper'
include Devise::TestHelpers

describe DashboardController do
  
  before(:each) do
    
    @user = Factory(:user_one)
    sign_in @user
  end

  describe "GET index" do

  end

end
