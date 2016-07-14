class CreateCookPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :cook_places do |t|
      t.references :cook, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
