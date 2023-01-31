class RemoveNameFromPlaces < ActiveRecord::Migration[5.0]
  def change
    remove_column :places, :name, :string
  end
end
