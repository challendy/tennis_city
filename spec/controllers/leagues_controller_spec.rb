require 'spec_helper'

describe LeaguesController do

  describe "GET show" do
    it "assigns me as @user (admin)" do
      login_admin
      get :edit, :id => @logged_in_user.id
      assigns[:user].should == @logged_in_user
    end
  end
end
