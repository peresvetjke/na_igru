class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.text :body, null: false
      t.references :recepient, null: false, foreign_key: {to_table: :players}
      t.boolean :viewed, default: false
      t.references :game, null: false

      t.timestamps
    end
  end
end
