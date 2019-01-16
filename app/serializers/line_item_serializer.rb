class LineItemSerializer < ActiveModel::Serializer
  attributes :product_id, :quantity, :unit_price_cents, :unit_price_currency, :total_price_cents, :total_price_currency, :unit_price_cents, :unit_price_currency
  belongs_to :product
  belongs_to :cart
end
