class GamePlayersController < ApplicationController
  before_action :find_game, only: :create
  before_action :find_game_player, only: :destroy

  def create
    @game_player = @game.game_players.new(player_id: params[:id])
    if @game_player.save
      redirect_to game_path(@game_player.game), notice: "Player #{@game_player.player.email} was assigned."
    else
      render "games/show"
    end
  end

  def destroy
    @game_player.destroy

    flash[:notice] = "Player #{@game_player.player.email} was removed."

    redirect_to game_path(@game_player.game)
  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

  def find_game_player
    @game_player = GamePlayer.find(params[:id])
  end
end