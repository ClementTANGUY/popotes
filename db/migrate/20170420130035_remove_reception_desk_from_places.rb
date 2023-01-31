class RemoveReceptionDeskFromPlaces < ActiveRecord::Migration[5.0]
  def change
    remove_column :places, :reception_desk, :boolean
  end
end
