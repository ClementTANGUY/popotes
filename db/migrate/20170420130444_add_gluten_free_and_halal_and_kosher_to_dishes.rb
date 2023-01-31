class AddGlutenFreeAndHalalAndKosherToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :gluten_free, :boolean
    add_column :dishes, :halal, :boolean
    add_column :dishes, :kosher, :boolean
  end
end
