class Cook < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :age, presence: true
  validates :bio, presence: true
end
