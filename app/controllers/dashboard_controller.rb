class DashboardController < ApplicationController
  layout 'dashboard'
  
  def index
    @created_leagues = current_user.leagues_status("created")
    @confirmed_leagues = current_user.leagues_status("confirmed")
    @active_leagues = current_user.leagues_status("active")
    @completed_leagues = current_user.leagues_status("completed")    
  end
  
end
