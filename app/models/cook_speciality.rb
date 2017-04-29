class CookSpeciality < ApplicationRecord

  belongs_to :speciality
  belongs_to :cook
  accepts_nested_attributes_for :speciality

  after_destroy :delete_speciality

  private

    def delete_speciality
      speciality.delete
    end

end
