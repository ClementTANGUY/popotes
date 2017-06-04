class Cook < ApplicationRecord

  has_attachment :avatar

  belongs_to :user

  has_many :dishes, dependent: :destroy

  has_many :cook_specialities, dependent: :destroy
  has_many :specialities, through: :cook_specialities
  accepts_nested_attributes_for :cook_specialities, allow_destroy: true
  accepts_nested_attributes_for :specialities

  has_many :cook_places, dependent: :destroy
  has_many :places, through: :cook_places
  accepts_nested_attributes_for :cook_places, allow_destroy: true
  accepts_nested_attributes_for :places

  validates :age, :bio, presence: true

  validate :validate_specialities
  validate :validate_places

  private

    def validate_specialities
      if specialities.size > 2
        errors.add(:Spécialités, "limitées à 2")
      end
    end

    def validate_places
      if places.size > 3
        errors.add(:Adresses, "limitées à 3")
      end
    end

end
