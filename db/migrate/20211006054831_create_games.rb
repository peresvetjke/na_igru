class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :organizator_id, null: false
      t.references :location, null: false, foreign_key: true
      t.datetime :starting_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
