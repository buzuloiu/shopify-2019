require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get carts_url, as: :json
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: { completed_at: @cart.completed_at, total: @cart.total } }, as: :json
    end

    assert_response 201
  end

  test "should show cart" do
    get cart_url(@cart), as: :json
    assert_response :success
  end

  test "should update cart" do
    patch cart_url(@cart), params: { cart: { completed_at: @cart.completed_at, total: @cart.total } }, as: :json
    assert_response 200
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      delete cart_url(@cart), as: :json
    end

    assert_response 204
  end

  test "should not complete completed cart" do
  end

  test "should complete cart" do

  end

  test "should add to cart" do
  end

  test "should update existing cart item when adding existing item to cart" do

  end


end
