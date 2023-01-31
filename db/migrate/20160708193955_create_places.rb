class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :full_address
      t.string :zip_code
      t.string :city
      t.string :kind_of_place
      t.boolean :reception_desk

      t.timestamps
    end
  end
end
