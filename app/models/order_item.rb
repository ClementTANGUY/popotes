class OrderItem < ApplicationRecord

  belongs_to :dish
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # validate :order_item_quantity

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
  # def order_item_quantity
  #   if quantity > dish.portion_count
  #     errors.add(:Seulement, "#{dish.portion_count} #{'portion'.pluralize(dish.portion_count)} #{'disponible'.pluralize(dish.portion_count)}")
  #   end
  # end

  def dish_present
    if dish.nil?
      errors.add(:Plat, "invalide ou inexistant")
    end
  end

  def order_present
    if order.nil?
      errors.add(:Commande, "invalide")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end
