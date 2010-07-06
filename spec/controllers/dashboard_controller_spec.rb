require 'spec_helper'
include Devise::TestHelpers

describe DashboardController do
  
  before(:each) do
    
    @user = Factory(:user_one)
    sign_in @user
  end

  describe "GET index" do
    it "initilizes all league and team statuses for user all" do
      get :index
      response.should render_template("index")
    end
  end

end
