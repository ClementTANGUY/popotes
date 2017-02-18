class Cart < ApplicationRecord

  has_many :order_items, dependent: :destroy

  def add_dish(dish)
    current_item = order_items.find_by(dish_id: dish.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_items.build(dish_id: dish.id, quantity: "1")
    end
    current_item
  end

  def total_quantity
    order_items.collect { |oi| oi.valid? ? (oi.quantity) : 0 }.sum
  end

  def subtotal
    order_items.to_a.sum { |oi| oi.total_price }
  end

  def charge
    subtotal * 0.15
  end

  def total_amount
    subtotal + charge
  end

end
