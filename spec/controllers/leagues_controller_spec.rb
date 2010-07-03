require 'spec_helper'

describe LeaguesController do

  # describe "GET edit" do
  #   it "assigns me as @user (admin)" do
  #     login_admin
  #     get :edit, :id => @logged_in_user.id
  #     assigns[:user].should == @logged_in_user
  #   end
  # 
  #   it "assigns the requested user as @user (admin)" do
  #     login_admin
  #     get :edit, :id => @logged_in_user.id
  #     assigns[:user].should == @logged_in_user
  #   end
  # 
  #   it "assigns me as @user (my data)" do
  #     login_user
  #     get :edit, :id => @logged_in_user.id
  #     assigns[:user].should == @logged_in_user
  #   end
  # 
  #   it "tells me to bugger off (not admin)" do
  #     login_user
  #     get :edit, :id => @other_user.id
  #     flash[:error].should match "You must be an administrator to access this page."
  #     end
  # 
  #   it "redirects to root (not admin)" do
  #     login_user
  #     get :edit, :id => @other_user.id
  #     response.should redirect_to(root_path)
  #   end
  # 
  #   it "tells me to log in (not logged in)" do
  #     get :edit, :id => @other_user.id
  #     flash[:error].should match "Please log in to access this page."
  #   end
  # 
  #   it "redirects to login (not logged in)" do
  #     get :edit, :id => @other_user.id
  #     response.should redirect_to(login_path)
  #   end
  # end
end
