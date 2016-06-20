class Dish < ApplicationRecord

  belongs_to :cook

  validates :name, presence: true
  validates :kind_of_dish, inclusion: { in: %w(Entrée Plat\ principal Dessert\ &\ Patisserie),
    message: "%{value} n'est pas autorisé" }
  validates :speciality, inclusion: { in: %w(Grandes\ tables Terroir\ &\ Famille Cuisines\ du\ monde "Bio\ &\ Diététique),
    message: "%{value} n'est pas autorisé" }
  validates :description, presence: true
  validates :portion_size, inclusion: { in: %w(Petite\ (env.\ 100g) Moyenne\ (150-250g) Grande\ (>250g)),
    message: "%{value} n'est autorisé" }
  validates :portion_count, presence: true
end
