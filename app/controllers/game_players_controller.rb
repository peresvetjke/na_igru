class GamePlayersController < ApplicationController
  before_action :find_game, only: %i[index destroy]

  def index
    @game_players = @game.players_assigned
  end

  def destroy
    @game_player.destroy

    flash[:notice] = "Player #{@game_player.player.email} was removed."

    redirect_to game_game_players(@game)
  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

  def find_game_player
    @game_player = GamePlayer.find(params[:id])
  end
end