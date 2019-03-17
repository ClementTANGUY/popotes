class Place < ApplicationRecord

  has_many :cook_places
  has_many :cooks, through: :cook_places

  validates :full_address, :zip_code, :city, presence: true
  validates :kind_of_place, presence: true, inclusion: { in: %w(Domicile Bureaux/Agence Commerce/Restaurant Parc/Lieu\ public),
    message: "%{value} n'est pas autorisé" }

  geocoded_by :full_place

  after_validation :geocode, if: :full_place_changed?

  def full_place
    "#{full_address}, #{zip_code}, #{city}"
  end

  def full_place_changed?
    full_address_changed? || zip_code_changed? || city_changed?
  end

  def self.active
    where(active: true)
  end

end
