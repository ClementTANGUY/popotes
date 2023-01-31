class AddExpDateToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :exp_date, :datetime
  end
end
