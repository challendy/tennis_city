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
    
    raise params.to_yaml
    
    @league = League.create(params["league"])
    raise @league.u
    @league.process_league_teams
    
  end
end
