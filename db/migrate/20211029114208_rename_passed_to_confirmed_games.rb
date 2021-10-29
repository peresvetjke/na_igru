class RenamePassedToConfirmedGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :passed, :confirmed
  end
end
