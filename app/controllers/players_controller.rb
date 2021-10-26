class PlayersController < ApplicationController
  respond_to :html, :xml, :json

# GET /clients/counts
# GET /clients/counts.json

  before_action :find_player, only: :show

  def index
    @players = Player.all
    respond_with(@players)
=begin
    respond_to do |format|
      format.html
      format.json { render json: @players.to_json }
      format.xml  { render xml: @players }
      format.any
    end
=end
  end

  def show
    @player = Player.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @player.to_json }
      format.any
    end
  end

  def counts
    respond_with(Player.all_with_counts) do |format|
      format.html { redirect_to players_path }
    end
  end

  private

  def find_player
    @player = Player.find(params[:id])
  end
end