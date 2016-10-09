class Place < ApplicationRecord

  has_many :cook_places
  has_many :cooks, through: :cook_places

  validates :full_address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :kind_of_place, presence: true, inclusion: { in: %w(Domicile Bureaux/Agence Magasin/Restaurant Lieu\ public),
    message: "%{value} n'est pas autorisé" }
  validates :reception_desk, presence: true

  geocoded_by :full_place
  after_validation :geocode, if: ->(obj){ obj.full_place.present? and obj.full_place_changed? }

  def full_place
    "#{full_address}, #{zip_code}, #{city}"
  end

  def full_place_changed?
      full_address_changed? || zip_code_changed? || city_changed?
  end

end
