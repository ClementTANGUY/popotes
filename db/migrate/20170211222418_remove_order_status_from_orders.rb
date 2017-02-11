class RemoveOrderStatusFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_reference :orders, :order_status, foreign_key: true
  end
end
