class RemoveOrderStatusFromOrders < ActiveRecord::Migration[5.0]
  def up
    remove_reference :orders, :order_status, foreign_key: true
  end

  def down
    add_reference :order, :order_status, foreign_key: true
  end
end
