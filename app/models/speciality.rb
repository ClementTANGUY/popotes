class Speciality < ApplicationRecord

  has_many :cook_specialities
  has_many :cooks, through: :cook_specialities

  validates :name, presence: true, inclusion: { in: %w(Gastronomique Terroir\ &\ Famille Cuisines\ du\ monde Bio\ &\ Diététique),
    message: "%{value} n'est pas autorisé" }
  validates :level, presence: true, inclusion: { in: %w(Top\ Chef Avancé Amateur Débutant),
    message: "%{value} n'est pas autorisé" }

end
