class CreateCooks < ActiveRecord::Migration[5.0]
  def change
    create_table :cooks do |t|
      t.string :last_name
      t.string :first_name
      t.integer :age
      t.text :bio
      t.integer :review_count
      t.float :stars

      t.timestamps
    end
  end
end
