require 'test_helper'

class OrderItemsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @order_item = order_items(:two)
  end

  test "should create order_item" do
    assert_difference('OrderItem.count') do
      post order_items_url, params: { dish_id: dishes(:moelleux).id }
    end

    follow_redirect!
  end

  test "should create order_item via ajax" do
    assert_difference('OrderItem.count') do
      post order_items_url, params: { dish_id: dishes(:moelleux).id },
        xhr: true
    end

    assert_response :success
  end

  test "should increment order_item via ajax" do
    post increment_order_item_url(@order_item),
      params: { order_item: { quantity: + 1 } },
      xhr: true
  end

  test "should decrement order_item via ajax" do
    post decrement_order_item_url(@order_item),
      params: { order_item: { quantity: - 1 } },
      xhr: true
  end

  test "should destroy order_item with quantity of 1 when decrement via ajax" do
      post decrement_order_item_url(order_items(:three)),
        params: { order_item: { quantity: - 1 } }
      assert_difference('OrderItem.count', -1) do
        delete order_item_url(order_items(:three)),
          xhr: true
      end

      assert_equal 'Popote supprimée de votre panier', flash[:alert]
  end

  test "should destroy order_item via ajax" do
    assert_difference('OrderItem.count', -1) do
      delete order_item_url(order_items(:three)),
        xhr: true
    end

    assert_equal 'Popote supprimée de votre panier', flash[:alert]
  end

end
