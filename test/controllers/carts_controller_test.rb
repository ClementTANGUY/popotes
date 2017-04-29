require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dish = dishes(:moelleux)
  end

  test "should show cart" do
    post order_items_url, params: { dish_id: @dish.id }
    @cart = Cart.find(session[:cart_id])
    get cart_url(@cart)
    assert_response :success
  end

  test "should destroy cart" do
    post order_items_url, params: { dish_id: @dish.id }
    @cart = Cart.find(session[:cart_id])

    assert_difference('Cart.count', -1) do
      delete cart_url(@cart)
    end

    assert_redirected_to cooks_url
    assert_equal 'Votre panier est vide', flash[:notice]
  end
end
