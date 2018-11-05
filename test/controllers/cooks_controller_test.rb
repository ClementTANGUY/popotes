# require 'test_helper'

# class CooksControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @user = users(:clem)
#     login_as (@user)
#     @cook = cooks(:one)
#     @update = {
#       age:  41,
#       bio:  'expandable fellow'
#     }
#   end

#   # called after every single test
#     teardown do
#       # when controller is using cache it may be a good idea to reset it afterwards
#       Rails.cache.clear
#     end

#   test "should get index" do
#     get cooks_url
#     assert_response :success
#     assert_select '.row .col-sm-6', 3
#     assert_select '#map-container #map', 1
#   end

#   test "should show cook" do
#     get cook_url(@cook)
#     assert_response :success
#   end

#   test "should get new" do
#     get new_cook_url
#     assert_response :success
#   end

#   test "should create cook" do
#     assert_difference('Cook.count') do
#       post cooks_url, params: { cook: @update }
#     end

#     assert_redirected_to cook_url(Cook.last)
#     assert_equal 'Votre profil a bien été créé', flash[:notice]
#   end

#   test "should get edit" do
#     get edit_cook_url(@cook)
#     assert_response :success
#   end

#   test "should update cook" do
#     patch cook_url(@cook), params: { cook: @update }
#     assert_redirected_to cook_url(@cook)
#     assert_equal 'Votre profil a bien été modifié', flash[:notice]
#   end

#   test "should destroy cook" do
#     assert_difference('Cook.count', -1) do
#       delete cook_url(@cook)
#     end

#     assert_redirected_to cooks_path
#     assert_equal 'Votre profil a bien été supprimé', flash[:notice]
#   end

# end
