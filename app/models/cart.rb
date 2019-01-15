class Cart < ApplicationRecord
  has_many :line_items
  before_save :update_subtotal

  def all_items_available?
    @line_items = self.line_items
    @line_items.each do |item|
      if !item.is_available?
        return false
      end
    end
    return true
  end

private
  def update_subtotal

    #self[:subtotal] = subtotal
  end

end
