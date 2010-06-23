class LeaguesController < ApplicationController
  layout 'dashboard'
  
  def index
    @league = League.find(:all)
  end
  
  def show
    @league = league.find(params[:id])
  end
  
  def new
    @league = League.new
    10.times do 
      @league.teams.build()
    end
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
end
