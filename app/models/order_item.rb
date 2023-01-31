class OrderItem < ApplicationRecord

  belongs_to :dish, optional: true
  belongs_to :order, optional: true
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :dish_present
  validate :cart_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      dish.price
    end
  end

  def up(dish)
    if quantity < dish.portion_count
    self[:quantity] += 1
  end
  end

  def down
    if quantity > 1
    self[:quantity] -= 1
    else
    self.destroy
    end
  end

  def total_price
    unit_price * quantity
  end

  def cook_charge
    total_price * 0.1
  end

  def net_for_cook
    total_price * 0.9
  end

  private

    def dish_present
      if dish.nil?
        errors.add(:Plat, "invalide")
      end
    end

    def cart_present
      if cart.nil?
        errors.add(:Panier, "invalide")
      end
    end

    def finalize
      self[:unit_price] = unit_price
      self[:total_price] = quantity * self[:unit_price]
    end

end
