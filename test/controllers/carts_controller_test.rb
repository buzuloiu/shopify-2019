require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = FactoryBot.create(:cart)
    @user = FactoryBot.create(:user)
    @api_key = JsonWebToken.encode(user_id: @user.id)
  end

  test "should list carts" do
    get api_v1_carts_url,
      params: { authentication: @api_key },
    as: :json
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      put api_v1_carts_url,
       params: { cart: { completed_at: @cart.completed_at, total_cents: @cart.total_cents },
       authentication: @api_key },
      as: :json
    end

    assert_response 201
  end

  test "should show cart" do
    get api_v1_cart_url(@cart),
      params: { authentication: @api_key },
    as: :json
    assert_response :success
  end

  test "should update cart" do
    post api_v1_cart_url(@cart), params: { cart: { completed_at: @cart.completed_at, total_cents: @cart.total_cents } }, as: :json
    assert_response 200
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
