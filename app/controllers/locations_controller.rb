class LocationsController < ApplicationController
  before_action :find_location, only: %i[show edit update update_inline destroy]
  before_action :set_locations, only: %i[index update_inline]

  def index
    
  end

  def favorite
    @locations = current_player.favorite_locations
    render :index
  end

  def show
    @games = @location.games
  end

  def new
    @location = Location.new
  end

  def create
    byebug
    @location = Location.new(location_params)
    
    if @location.save
      redirect_to @location
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end

  def update_inline
    byebug
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :index
    end
  end

  def destroy
    @location.destroy
    flash[:notice] = "Location has been destroyed."

    redirect_to locations_path
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def set_locations
    @locations = Location.all
  end
  
  def location_params
    params.require(:location).permit(:title, :default_min_players, :default_max_players, :lng, :lat, :region, :district, :place)
  end
end