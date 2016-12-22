class OrderItem < ApplicationRecord

  belongs_to :dish
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :dish_quantity
  validate :dish_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      dish.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def dish_quantity
    if dish.portion_count < quantity
      errors.add(:quantité, "supérieure au nombre de portion(s) disponible(s)")
    end
  end
  def dish_present
    if dish.nil?
      errors.add(:plat, "invalide ou inexistant")
    end
  end

  def order_present
    if order.nil?
      errors.add(:commande, "invalide")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end
