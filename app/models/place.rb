class Place < ApplicationRecord

  has_many :cook_places
  has_many :cooks, through: :cook_places

  validates :name, presence: true
  validates :full_address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :kind_of_place, presence: true, inclusion: { in: %w(Domicile Bureaux/Agence Magasin/Restaurant Lieu\ public),
    message: "%{value} n'est pas autorisé" }
  validates :reception_desk, presence: true

end
