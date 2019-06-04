require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
    @user = FactoryBot.create(:user)
    @api_key = JsonWebToken.encode(user_id: @user.id)
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post api_v1_line_items_url, params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id, quantity: @line_item.quantity, total_price: @line_item.total_price_cents } }, as: :json
    end

    assert_response 201
  end

  test "should show line_item" do
    get api_v1_line_item_url(@line_item),
      params: { authentication: @api_key },
    as: :json
    assert_response :success
  end

  test "should update line_item" do
    patch api_v1_line_item_url(@line_item),
      params: { line_item: { cart_id: @line_item.cart_id,
                             product_id: @line_item.product_id,
                             quantity: @line_item.quantity,
                             total_price: @line_item.total_price_cents },
                authentication: @api_key},
      as: :json
    assert_response 200
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete api_v1_line_item_url(@line_item),
        params: { authentication: @api_key },
      as: :json
    end

    assert_response 204
  end
end
