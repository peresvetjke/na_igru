class PlayersController < ApplicationController
  before_action :find_player, only: :show

  def index
    @players = Player.all
  end

  def show

  end


  private

  def find_player
    @player = Player.find(params[:id])
  end
end