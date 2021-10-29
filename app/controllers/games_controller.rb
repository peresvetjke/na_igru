class GamesController < ApplicationController
  before_action :find_player,   only: :index,               if: -> { params[:player_id].present? }
  before_action :find_location, only: %i[index new create], if: -> { params[:location_id].present? }
  before_action :set_games, only: :index,                   if: -> { params[:player_id].nil? && params[:location_id].nil? }
  before_action :find_game, only: %i[show edit update destroy join leave cancel confirm]

  def index

  end

  def show
    @game_players = GamePlayer.where(game: @game)
  end

  def join
    current_player.join_game(@game)
    redirect_to @game, notice: "You joined the game."
  end

  def leave
    current_player.leave_game(@game)
    redirect_to @game, notice: "You left the game."
  end

  def cancel
    @game.cancel
    redirect_to @game, notice: "The game was cancelled."
  end

  def confirm
    @game.confirm
    redirect_to @game, notice: "The game was confirmed."
  end

  def new
    @game = Game.new if @game.nil?
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

  def find_location
    @location = Location.find(params[:location_id])
    @games = @location.games
    @game = @location.games.new
  end

  def find_player
    @player = Player.find(params[:player_id])
    @games = Game.games_player_in(@player)
  end
  
  def set_games
    @games = Game.all
  end

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:id, :location_id, :min_players, :max_players, :passed, starting_time: [], end_time: [], :game_players_attributes => [:id, :attended, :paid])
  end


end