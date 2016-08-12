class CookPlace < ApplicationRecord

  belongs_to :cook
  belongs_to :place
  accepts_nested_attributes_for :place

end
