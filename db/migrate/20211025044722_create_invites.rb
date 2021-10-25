class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.references :game, null: false
      t.references :recepient, null: false, foreign_key: {to_table: :players}
      t.boolean :accepted

      t.timestamps
    end
  end
end
