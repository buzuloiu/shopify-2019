class Product < ApplicationRecord
  has_many :line_items
  scope :qty_available, -> (qty_available) { where("inventory_count >= ?", qty_available) if qty_available.present? }
  scope :by_product, -> (id) { where(id: id) if id.present? }
  validates :inventory_count, numericality: { greater_than: -1 }
  validates :title, presence: true


  def purchase
    self.inventory_count -= 1
    self.save
  end
end
