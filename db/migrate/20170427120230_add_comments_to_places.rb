class AddCommentsToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :comments, :text
  end
end
