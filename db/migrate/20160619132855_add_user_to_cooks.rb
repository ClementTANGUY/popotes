class AddUserToCooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :cooks, :user, foreign_key: true
  end
end
