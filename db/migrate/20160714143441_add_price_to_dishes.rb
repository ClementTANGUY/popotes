class AddPriceToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :price, :decimal, precision: 12, scale: 3
  end
end
