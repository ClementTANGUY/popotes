require 'test_helper'

class DishTest < ActiveSupport::TestCase
  fixtures :dishes

  test "should create a new order item when adding a new dish" do
    cart = Cart.create

    cart.add_dish(dishes(:moelleux)).save!
    assert_equal cart.order_items.count, 1
    assert_equal cart.order_items[0].quantity, 1
    assert_equal cart.subtotal, dishes(:moelleux).price
  end

  test "should create two order items when adding two different dishes" do
    cart = Cart.create

    cart.add_dish(dishes(:moelleux)).save!
    cart.add_dish(dishes(:three)).save!
    assert_equal cart.order_items.count, 2
    assert_equal cart.order_items[0].quantity, 1
    assert_equal cart.order_items[1].quantity, 1
    assert_equal cart.subtotal, dishes(:moelleux).price + dishes(:three).price
  end

  test "should increment an existing order item when adding existing dish" do
    cart = Cart.create

    cart.add_dish(dishes(:moelleux)).save!
    cart.add_dish(dishes(:moelleux)).save!
    assert_equal cart.order_items.count, 1
    assert_equal cart.order_items[0].quantity, 2
    assert_equal cart.subtotal, dishes(:moelleux).price * 2
  end


end
