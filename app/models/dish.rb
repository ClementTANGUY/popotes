class Dish < ApplicationRecord
  validates :name, presence: true
  validates :kind_of_dish, presence: true, inclusion: {in: ["Entrée", "Plat principal", "Dessert/Patisserie"]}
  validates :speciality, presence: true, inclusion: {in: ["Grandes tables", "Terroir & Famille", "Cuisines du monde", "Bio & Diététique"]}
  validates :description, presence: true
  validates :portion_size, presence: true, inclusion: {in: ["Petit", "Moyen", "Grand"]}
  validates :portion_count, presence: true
end
