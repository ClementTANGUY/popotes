class RemoveLastNameAndFirstNameFromCooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :cooks, :last_name, :string
    remove_column :cooks, :first_name, :string
  end
end
