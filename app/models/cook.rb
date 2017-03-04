class Cook < ApplicationRecord

  has_attachment :avatar

  belongs_to :user

  has_many :dishes, dependent: :destroy

  has_many :cook_specialities, dependent: :destroy
  has_many :specialities, through: :cook_specialities
  accepts_nested_attributes_for :cook_specialities, allow_destroy: true

  has_many :cook_places, dependent: :destroy
  has_many :places, through: :cook_places
  accepts_nested_attributes_for :cook_places, allow_destroy: true
  accepts_nested_attributes_for :places

  validates :user, presence: true, uniqueness: true
  validates :age, presence: true
  validates :bio, presence: true

  validate :validate_places

private

    def validate_places
      if places.size > 3
        errors.add(:Adresses, "limitées à 3")
      end
    end
end
