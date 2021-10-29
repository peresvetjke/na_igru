class PlayerLocationsController < ApplicationController

  def create
    @location = Location.find(params[:location_id])
    current_player.favorite_locations.push(@location)

    redirect_to locations_path, notice: "Location \"#{@location.title}\" added to favorites"
  end

  def destroy
    @player_location = PlayerLocation.find(params[:id])
    location = @player_location.location

    @player_location.destroy
    redirect_to locations_path, notice: "Location \"#{location.title}\" removed from favorites"
  end

end