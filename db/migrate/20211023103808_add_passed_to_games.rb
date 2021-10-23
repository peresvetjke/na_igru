class AddPassedToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :passed, :boolean
  end
end
