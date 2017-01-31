class Order < ApplicationRecord

    belongs_to :order_status

    has_many :order_items

    before_validation :set_order_status

    before_save :update_subtotal

    before_save :update_total_amount

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
      self.order_status_id = 1 if self.order_status_id.nil?
    end

    def update_subtotal
      self[:subtotal] = subtotal
    end

    def update_total_amount
      self[:total_amount] = total_amount
    end

end
