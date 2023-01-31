class CreateCookSpecialities < ActiveRecord::Migration[5.0]
  def change
    create_table :cook_specialities do |t|
      t.references :speciality, foreign_key: true
      t.references :cook, foreign_key: true

      t.timestamps
    end
  end
end
