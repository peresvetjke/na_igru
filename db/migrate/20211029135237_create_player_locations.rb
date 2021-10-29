class CreatePlayerLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :player_locations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
