require 'test_helper'

class DishTest < ActiveSupport::TestCase
  fixtures :cooks
  fixtures :dishes

  test "dish attributes must not be empty" do
    dish = Dish.new
    assert dish.invalid?
    assert dish.errors[:name].any?
    assert dish.errors[:kind_of_dish].any?
    assert dish.errors[:speciality].any?
    assert dish.errors[:description].any?
    assert dish.errors[:portion_size].any?
    assert dish.errors[:portion_count].any?
    assert dish.errors[:price].any?
    assert dish.errors[:exp_date].any?
    assert dish.errors[:collect_date].any?
  end

  test "dish price must be positive" do
    dish = Dish.new(name:          "My dish name",
                    kind_of_dish:  "Dessert & Patisserie",
                    speciality:    "Terroir & Famille",
                    description:   "My dish description",
                    veggie:         "true",
                    cooked:         "true",
                    be_reheated:    "false",
                    gluten_free:    "false",
                    halal:          "false",
                    kosher:         "false",
                    portion_size:   "Moyenne (200-300g)",
                    portion_count:  1,
                    exp_date:       "10/02/2035 20:00:00",
                    collect_date:   "11/02/2035 12:00:00",
                    cook: cooks(:one))
    dish.price = - 1
    assert dish.invalid?
    assert_equal ["doit être supérieur ou égal à 1"],
      dish.errors[:price]

    dish.price = 0
    assert dish.invalid?
    assert_equal ["doit être supérieur ou égal à 1"],
      dish.errors[:price]

    dish.price = 1
    assert dish.valid?
  end

  test "dish portion_count must be greater than or equal to 0" do
    dish = Dish.new(name:          "My dish name",
                    kind_of_dish:  "Dessert & Patisserie",
                    speciality:    "Terroir & Famille",
                    description:   "My dish description",
                    veggie:         "true",
                    cooked:         "true",
                    be_reheated:    "false",
                    gluten_free:    "false",
                    halal:          "false",
                    kosher:         "false",
                    portion_size:   "Moyenne (200-300g)",
                    price:          5.00,
                    exp_date:       "10/02/2035 20:00:00",
                    collect_date:   "11/02/2035 12:00:00",
                    cook: cooks(:one))
    dish.portion_count = - 1
    assert dish.invalid?
    assert_equal ["doit être supérieur ou égal à 0"],
      dish.errors[:portion_count]

    dish.portion_count = 0
    assert dish.valid?
  end

end
