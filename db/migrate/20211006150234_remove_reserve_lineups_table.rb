class RemoveReserveLineupsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :reserve_lineups
  end
end
