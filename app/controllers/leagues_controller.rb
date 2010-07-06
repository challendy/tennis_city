class LeaguesController < ApplicationController
  layout 'dashboard'
  
  def index
    @league = current_user.leagues
  end
  
  def show
    @league = league.find(params[:id])
  end
  
  def new
    @league = League.new
    10.times do 
      @league.teams.build
    end
    @users = get_users
  end
  
  def create
    @league = current_user.leagues.new(params[:league])
    @league.manager = current_user
    if @league.save!
      flash[:notice] = "League has been successfully created! Once all the teams have been confirmed you can proceed to the draft."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def matchups
    @leagues_matchups = current_user.leagues_status("active")
  end
end
