class AddCollectDateToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :collect_date, :datetime
  end
end
