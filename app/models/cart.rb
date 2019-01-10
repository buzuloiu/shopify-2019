class Cart < ApplicationRecord
  has_many :line_items
  before_save :update_subtotal
  
private
  def update_subtotal
    #self[:subtotal] = subtotal
  end

end
