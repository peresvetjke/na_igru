class LocationsController < ApplicationController
  before_action :find_location, only: %i[show edit update destroy]

  def index
    @locations = Location.all
  end

  def show

  end

  def new
    @location = Location.new
  end

  def create
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
      redirect_to @location
    else
      render :edit
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

  def location_params
    params.require(:location).permit(:title, :default_min_players, :default_max_players)
  end
end