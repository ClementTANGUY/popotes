class AddCartToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_items, :cart, foreign_key: true
  end
end
