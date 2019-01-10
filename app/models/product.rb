class Product < ApplicationRecord
  scope :in_stock, -> (in_stock) { where(in_stock: in_stock) if in_stock.present? }
end
