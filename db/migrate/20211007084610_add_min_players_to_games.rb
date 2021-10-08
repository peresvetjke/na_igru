class AddMinPlayersToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :min_players, :integer
    add_column :games, :max_players, :integer
  end
end
