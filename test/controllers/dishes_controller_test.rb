require 'test_helper'

class DishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dish = dishes(:one)
    @update = {
      name:         'Moucrènes',
      kind_of_dish: 'Entrée',
      speciality:   'Terroir & Famille',
      description:  'Moucrènes à la glaviouse',
      veggie:       true,
      cooked:       true,
      be_reheated:  false,
      portion_size: 'Petite (env. 150g)',
      portion_count: 5,
      price:         5.00,
      exp_date:      '10/02/2035 20:00:00',
      collect_date:  '11/02/2035 12:00:00'
    }
  end

  test "should get index" do
    get cook_url
    assert_response :success
  end

  test "should get new" do
    get new_cook_dish_url
    assert_response :success
  end

  test "should create dish" do
    assert_difference('Dish.count') do
      post cook_dishes_url, params: { dish: @update }
    end

    assert_redirected_to cook_url(Dish.last)
  end

  test "should update dish" do
    patch cook_dish_url(@dish), params: { dish: @update }
    assert_redirected_to cook_url(@dish)
  end

end
