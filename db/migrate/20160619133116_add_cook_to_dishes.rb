class AddCookToDishes < ActiveRecord::Migration[5.0]
  def change
    add_reference :dishes, :cook, foreign_key: true
  end
end
