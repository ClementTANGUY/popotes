class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy

  before_save :finalize

  def total_quantity
    order_items.collect { |oi| oi.valid? ? (oi.quantity) : 0 }.sum
  end

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def charge
    subtotal * 0.15
  end

  def total_amount
    subtotal + charge
  end

private

  def finalize
    self[:subtotal] = subtotal
    self[:total_amount] = total_amount
  end

end
