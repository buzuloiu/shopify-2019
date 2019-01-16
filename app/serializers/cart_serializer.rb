class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_cents, :total_currency, :completed_at
  has_many :line_items

end
