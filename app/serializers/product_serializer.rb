class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :inventory_count, :price_cents, :price_currency
end
