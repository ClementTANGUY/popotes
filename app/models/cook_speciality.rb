class CookSpeciality < ApplicationRecord

  belongs_to :speciality
  belongs_to :cook
  accepts_nested_attributes_for :speciality

end
