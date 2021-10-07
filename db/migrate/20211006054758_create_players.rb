class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.text :email
      t.text :password
      t.text :type, null: false, default: 'Player'

      t.timestamps
    end
  end
end
