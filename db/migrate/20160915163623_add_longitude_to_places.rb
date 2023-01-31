class AddLongitudeToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :longitude, :float
  end
end
