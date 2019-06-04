require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = FactoryBot.create(:product, :in_stock)
    @product_no_stock = FactoryBot.create(:product, :out_of_stock)
    @user = FactoryBot.create(:user)
    @api_key = JsonWebToken.encode(user_id: @user.id)
  end

  test "should get index" do
    get api_v1_products_url,
      params: { authentication: @api_key },
    as: :json
    assert_response :success
  end

  test "should show product" do
    get api_v1_product_url(@product.id),
      params: { authentication: @api_key },
    as: :json
    assert_response :success
  end

  test "should purchase product" do
    put api_v1_url(@product),
     params: { product: { inventory_count: @product.inventory_count,
                          price: @product.price_cents,
                          title: @product.title } },
    as: :json
    assert_response 200
  end

  test "should not purchase out of stock item" do

  end

  test "should only show in stock products" do
    get api_v1_products_url, params: {qty_available: 1}, as: :json
    assert_response :success
  end


end
