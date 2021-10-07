class RenameMainLineupsToGamePlayers < ActiveRecord::Migration[6.1]
  def change
    rename_table :main_lineups, :game_players
  end
end
