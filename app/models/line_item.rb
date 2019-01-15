class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  before_save :update_total_price



  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  #validate :product_present
  #validate :cart_present

  def is_available?
    @product = self.product
    puts @product.inventory_count >= self.quantity
    return @product.inventory_count >= self.quantity
  end

  def purchase
    if self.is_available?
      @product = self.product
      self.quantity.times do
        @product.purchase.save!
      end
    end
  end

  private
  def update_total_price
    self[:total_price_cents] = self.quantity*self.unit_price_cents
  end
end
