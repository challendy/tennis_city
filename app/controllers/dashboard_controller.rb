class DashboardController < ApplicationController
  layout 'dashboard'
  
  before_filter :initialize_dashboard  
  
  def index
    if @created_teams
      redirect_to(teams_path)
    end
    
  end
  
  private
  
  def initialize_dashboard
    @created_leagues = current_user.leagues_status("created")
    @confirmed_leagues = current_user.leagues_status("confirmed")
    @active_leagues = current_user.leagues_status("active")
    @completed_leagues = current_user.leagues_status("completed")
    
    @created_teams = current_user.teams_status("created")
    @confirmed_teams = current_user.teams_status("confirmed")    
  end
  
end
