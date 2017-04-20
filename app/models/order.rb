class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy

  has_many :dishes, through: :order_items

  before_save :finalize

  def subtotal
    order_items.to_a.sum { |oi| oi.total_price }
  end

  def charge
    subtotal * 0.15
  end

  # def cook_charge
  #   subtotal * 0.1
  # end

  def total_amount
    subtotal + charge
  end

  # def net_for_cook
  #   subtotal - cook_charge
  # end

  def add_order_items_from_cart(cart)
    cart.order_items.each do |order_item|
      order_item.cart_id = nil
      order_items << order_item
    end
  end

  def remove_dish_portion
    order_items.each do |order_item|
      dish = order_item.dish
      dish.portion_count -= order_item.quantity
      dish.save
    end
  end

private

  def finalize
    self[:subtotal] = subtotal
    self[:charge] = charge
    self[:total_amount] = total_amount
  end

end
