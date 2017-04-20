require 'test_helper'

class DishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:clem)
    login_as (@user)
    @cook = cooks(:one)
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

  test "should show dish" do
    get cook_dish_url(@cook, @dish)
    assert_response :success
  end

  test "should get new" do
    get new_cook_dish_url(@cook)
    assert_response :success
  end

  test "should create dish" do
    assert_difference('Dish.count') do
      post cook_dishes_url(@cook), params: { dish: @update }
    end

    assert_redirected_to cook_url(@cook)
    assert_equal 'Votre popote a bien été créée', flash[:notice]
  end

  test "should update dish" do
    patch cook_dish_url(@cook, @dish), params: { dish: @update }
    assert_redirected_to cook_url(@cook)
    assert_equal 'Votre popote a bien été mise à jour', flash[:notice]
  end

  test "can't delete dish in cart" do
    assert_difference('Dish.count', 0) do
      delete cook_dish_url(@cook, dishes(:two))
    end
  end

  test "should destroy dish" do
    assert_difference('Dish.count', -1) do
      delete cook_dish_url(@cook, @dish)
    end

    assert_redirected_to cook_url(@cook)
    assert_equal 'Votre popote a bien été supprimée', flash[:notice]
  end

end
