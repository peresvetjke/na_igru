class AddAttendedAndPaidToGamePlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :game_players, :attended, :boolean
    add_column :game_players, :paid, :boolean
  end
end
