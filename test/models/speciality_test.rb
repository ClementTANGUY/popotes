require 'test_helper'

class SpecialityTest < ActiveSupport::TestCase
  fixtures :specialities

  test "speciality attributes must not be empty" do
    speciality = Speciality.new
    assert speciality.invalid?
    assert speciality.errors[:name].any?
    assert speciality.errors[:level].any?
  end

end
