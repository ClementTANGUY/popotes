class CookPlace < ApplicationRecord

  belongs_to :cook
  belongs_to :place
  accepts_nested_attributes_for :place

  after_destroy :delete_place

  private

    def delete_place
      place.delete
    end

end
