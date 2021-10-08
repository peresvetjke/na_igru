class AddDefaultMinPlayersToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :default_min_players, :integer
    add_column :locations, :default_max_players, :integer
  end
end
