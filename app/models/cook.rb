class Cook < ApplicationRecord

  has_attachment :avatar

  belongs_to :user

  has_many :dishes, dependent: :destroy

  has_many :cook_specialities
  has_many :specialities, through: :cook_specialities

  has_many :cook_places
  has_many :places, through: :cook_places


  validates :user, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :age, presence: true
  validates :bio, presence: true
end
