class CreateReserveLineups < ActiveRecord::Migration[6.1]
  def change
    create_table :reserve_lineups do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
