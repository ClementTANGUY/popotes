class Order < ApplicationRecord

    belongs_to :order_status
    has_many :order_items
    after_create :set_order_status
    before_save :update_subtotal
    before_save :update_total_amount

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
    def set_order_status
      self.order_status_id = 1
    end

    def update_subtotal
      self[:subtotal] = subtotal
    end

    def update_total_amount
      self[:total_amount] = total_amount
    end

end
