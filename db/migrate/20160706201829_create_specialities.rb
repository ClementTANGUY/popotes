class CreateSpecialities < ActiveRecord::Migration[5.0]
  def change
    create_table :specialities do |t|
      t.string :name
      t.string :level

      t.timestamps
    end
  end
end
