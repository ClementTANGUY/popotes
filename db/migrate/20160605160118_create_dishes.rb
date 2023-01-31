class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :kind_of_dish
      t.string :speciality
      t.text :description
      t.boolean :veggie
      t.boolean :cooked
      t.boolean :be_reheated
      t.string :portion_size
      t.integer :portion_count

      t.timestamps
    end
  end
end
