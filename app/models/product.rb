class Product < ApplicationRecord
  scope :in_stock, -> (in_stock) { where(in_stock: in_stock) if in_stock.present? }
  scope :by_product, -> (id) { where(id: id) if id.present? }
end
