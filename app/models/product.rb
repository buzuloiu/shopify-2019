class Product < ApplicationRecord
  has_many :line_items
  scope :qty_available, -> (qty_available) { where("inventory_count > ?", qty_available) if qty_available.present? }
  scope :by_product, -> (id) { where(id: id) if id.present? }


  def purchase
    if self.inventory_count >= 1
      self.inventory_count -= 1
    end
    return self
  end
end
