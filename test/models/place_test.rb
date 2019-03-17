require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  fixtures :places

  test "place attributes must not be empty" do
    place = Place.new
    assert place.invalid?
    assert place.errors[:full_address].any?
    assert place.errors[:zip_code].any?
    assert place.errors[:city].any?
    assert place.errors[:kind_of_place].any?
  end

end
