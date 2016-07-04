class Cook < ApplicationRecord

  has_attachment :avatar
  belongs_to :user
  has_many :dishes, dependent: :destroy

  validates :user, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :age, presence: true
  validates :bio, presence: true
end
