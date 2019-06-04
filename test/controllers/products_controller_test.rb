require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get api_v1_products_url, as: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post api_v1_products_url, params: { product: { inventory_count: @product.inventory_count, price: @product.price_cents, title: @product.title } }, as: :json
    end

    assert_response 201
  end

  test "should show product" do
    get api_v1_product_url(@product), as: :json
    assert_response :success
  end

  test "should update product" do
    put api_v1_product_url(@product), params: { product: { inventory_count: @product.inventory_count, price: @product.price_cents, title: @product.title } }, as: :json
    assert_response 200
  end


  test "should purchase product" do
    put api_v1_product_purchase_url(@product), params: { product: { inventory_count: @product.inventory_count, price: @product.price_cents, title: @product.title } }, as: :json
    assert_response 200
  end

  test "should not purchase out of stock item" do

  end

  test "should only show in stock products" do
    get api_v1_products_url, params: {qty_available: 1}, as: :json
    assert_response :success
  end


end
