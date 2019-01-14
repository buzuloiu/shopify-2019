class Product < ApplicationRecord
  has_many :line_items
  scope :in_stock, -> (in_stock) { where("inventory_count > ?", 0) if in_stock.present? }
  scope :by_product, -> (id) { where(id: id) if id.present? }
end
