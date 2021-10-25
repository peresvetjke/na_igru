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

  def update_multiple
    byebug
    @game_players = GamePlayer.find(game_players_multiple_params[:game_players].keys)

    @game_players.each do |game_player|
      byebug
      game_player.update(game_players_multiple_params[:game][game_player.id])
    end

    byebug
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

  def game_players_multiple_params
    params.require(:game_players).permit(:id, :attended, :paid)
  end
end