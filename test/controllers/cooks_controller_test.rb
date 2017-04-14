require 'test_helper'

class CooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cook = cooks(:one)
    @update = {
      age:  40,
      bio:  'expandable fellow'
    }
  end

  test "should get index" do
    get cooks_url
    assert_response :success
  end

  test "should get new" do
    get new_cook_url
    assert_response :success
  end

  test "should create cook" do
    assert_difference('Cook.count') do
      post cooks_url, params: { cook: @update }
    end

    assert_redirected_to cook_url(Cook.last)
  end

  test "should update cook" do
    patch cook_url(@cook), params: { cook: @update }
    assert_redirected_to cook_url(@cook)
  end

end
