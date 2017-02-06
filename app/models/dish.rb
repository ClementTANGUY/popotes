class Dish < ApplicationRecord

  has_attachments :photos, maximum: 2

  belongs_to :cook

  has_many :order_items

  before_destroy :ensure_not_referenced_by_any_order_item

  validates :name, presence: true
  validates :kind_of_dish, presence: true, inclusion: { in: %w(Entrée Plat\ principal Dessert\ &\ Patisserie),
    message: "%{value} n'est pas autorisé" }
  validates :speciality, presence: true, inclusion: { in: %w(Gastronomique Terroir\ &\ Famille Cuisines\ du\ monde Bio\ &\ Diététique),
    message: "%{value} n'est pas autorisé" }
  validates :description, presence: true
  validates :portion_size, presence: true, inclusion: { in: %w(Petite\ (env.\ 150g) Moyenne\ (200-300g) Grande\ (>300g)),
    message: "%{value} n'est autorisé" }
  validates :portion_count, presence: true
  validates :price, presence: true
  validates :exp_date, presence: true
  validates :collect_date, presence: true

private

  # ensure that there are no order_items referencing this dish
  def ensure_not_referenced_by_any_order_item
    unless order_items.empty?
      errors.add(:base, 'Popote en cours de commande')
      throw :abort
    end
  end

end
