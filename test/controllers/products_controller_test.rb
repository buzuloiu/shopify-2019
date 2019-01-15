require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { inventory_count: @product.inventory_count, price: @product.price, title: @product.title } }, as: :json
    end

    assert_response 201
  end

  test "should show product" do
    get product_url(@product), as: :json
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { inventory_count: @product.inventory_count, price: @product.price, title: @product.title } }, as: :json
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product), as: :json
    end

    assert_response 204
  end

  test "should purchase product" do

  end

  test "should not purchase out of stock item" do

  end

  test "should only show in stock products" do
    get products_url, params: {qty_available: 0}, as: :json
    assert_response :success
  end


end
