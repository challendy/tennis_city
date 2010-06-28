class PlayersController < ApplicationController
  layout "dashboard"

  def index
    @players = Player.find(:all, :order => 'atp_rank ASC')
  end
  
  def show
    @player = Player.find(params[:id])
  end

end