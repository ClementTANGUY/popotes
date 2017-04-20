require 'test_helper'

class CookTest < ActiveSupport::TestCase
  fixtures :cooks

  test "cook attributes must not be empty" do
    cook = Cook.new
    assert cook.invalid?
    assert cook.errors[:age].any?
    assert cook.errors[:bio].any?
  end

end
