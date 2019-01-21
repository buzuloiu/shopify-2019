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

  def add_to_cart(product_id, quantity)
    if !Product.exists?(id: product_id)
      self.errors.add(:Product, "there is no product with this id")
      return
    else
      product = Product.find(product_id)
      @line_item = LineItem.create(
        cart_id: self.id,
        product_id: product.id,
        unit_price_cents: product.price_cents,
        total_price_currency: "USD",
        quantity: quantity,
        total_price_cents: nil,
        unit_price_currency: product.price_currency)
      self.save
    end
  end

  def complete
    if !self.completed?
      if self.all_items_available?
        @line_items = self.line_items
        @line_items.each(&:purchase)
        self.completed_at = DateTime.now
        self.save
      else
        self.errors.add(:Products, 'Products in your cart are not in stock')
        return
      end
    else
      self.errors.add(:Cart, 'This cart is already completed')
      return
    end
  end

  def completed?
    return !self.completed_at.nil?
  end

  def product_exists
    if !Product.find(self.product_id)
    end
  end

private
  def update_subtotal
    self[:total_cents] = 0
    @line_items = self.line_items
    if @line_items
      @line_items.each do |item|
        self[:total_cents] += item.total_price_cents
      end
    end
  end

end
