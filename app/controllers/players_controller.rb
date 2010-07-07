class PlayersController < ApplicationController

  def index
    @players = Player.all :order => 'atp_rank ASC'
  end
  
  def show
    @player = Player.find(params[:id])
  end

end