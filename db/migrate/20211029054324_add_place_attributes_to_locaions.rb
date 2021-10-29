class AddPlaceAttributesToLocaions < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :lng,      :text
    add_column :locations, :lat,      :text
    add_column :locations, :region,   :text
    add_column :locations, :district, :text
    add_column :locations, :place,    :text
  end
end