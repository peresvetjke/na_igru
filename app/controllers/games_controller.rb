class GamesController < ApplicationController
  before_action :find_game, only: :show

  def index
    @games = Game.all
  end

  def show
  end

  def new
  end

  def create
    @game = current_player.games.new(game_params)
    @game.starting_time = Time.zone.local(params['starting_time(1i)'].to_i, params['starting_time(2i)'].to_i, params['starting_time(3i)'].to_i, params['starting_time(4i)'].to_i, params['starting_time(5i)'].to_i)

    if @game.save
      redirect_to @game
    else
      render :new
    end    
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:location_id, starting_time: [])
  end
end