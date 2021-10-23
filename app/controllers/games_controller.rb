class GamesController < ApplicationController
  before_action :find_game, only: %i[show edit update destroy check_in check_out]

  def index
    @games = Game.all
  end

  def show
    @game_players = GamePlayer.where(game: @game)
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_player.games_organized.new(game_params)
    @game.starting_time = Time.zone.local(params[:game]['starting_time(1i)'].to_i, params[:game]['starting_time(2i)'].to_i, params[:game]['starting_time(3i)'].to_i, params[:game]['starting_time(4i)'].to_i, params[:game]['starting_time(5i)'].to_i)
    @game.end_time = Time.zone.local(params[:game]['end_time(1i)'].to_i, params[:game]['end_time(2i)'].to_i, params[:game]['end_time(3i)'].to_i, params[:game]['end_time(4i)'].to_i, params[:game]['end_time(5i)'].to_i)

    if @game.save
      redirect_to @game
    else
      render :new
    end    
  end

  def edit
    
  end

  def update
    if @game.update(game_params)
      if params[:game]['starting_time(1i)'].present?
        @game.starting_time = Time.zone.local(params[:game]['starting_time(1i)'].to_i, params[:game]['starting_time(2i)'].to_i, params[:game]['starting_time(3i)'].to_i, params[:game]['starting_time(4i)'].to_i, params[:game]['starting_time(5i)'].to_i)
        @game.end_time = Time.zone.local(params[:game]['end_time(1i)'].to_i, params[:game]['end_time(2i)'].to_i, params[:game]['end_time(3i)'].to_i, params[:game]['end_time(4i)'].to_i, params[:game]['end_time(5i)'].to_i)
      end

      @game.save

      redirect_to @game
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    flash[:notice] = "Game has been destroyed."

    redirect_to games_path
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:location_id, :min_players, :max_players, :passed, starting_time: [], end_time: [])
  end
end