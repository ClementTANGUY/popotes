class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy

  has_many :dishes, through: :order_items

  before_save :finalize

  with_options if: :should_not_signin? do |user|
    user.validates :first_name, :email, presence: true
    user.validates :first_name, length: { in: 2..20 }
    user.validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  end

  attr_accessor :not_signed_in

  def should_not_signin?
    not_signed_in
  end

  def subtotal
    order_items.sum { |oi| oi.total_price }
  end

  def charge
    subtotal * 0.10
  end

  def total_amount
    subtotal + charge
  end

  def in_the_pocket
    subtotal - charge
  end

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
