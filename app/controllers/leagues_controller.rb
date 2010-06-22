class LeaguesController < ApplicationController
  
  def show
    
  end
  
  def new
    @league = League.new
    10.times do 
      @league.teams.build()
    end
    
  end
  
  def create
    @league = League.create(params["league"])
    
    
    raise
    @league.process_league_teams
    
  end
end
