class TeamsController < ApplicationController
  
  def index
    @teams = current_user.teams
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      @team.team_confirmed!
      @team.league.check_league_status
      flash[:notice] = 'Team was successfully updated.'
      redirect_to :controller => :dashboard, :action => :index
    else
      flash[:notice] = 'Update Failed, Please try again.'
      render :action => "edit"
    end
  end
  
end
