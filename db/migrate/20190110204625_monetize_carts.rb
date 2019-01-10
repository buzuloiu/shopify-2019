class MonetizeCarts < ActiveRecord::Migration[5.2]
  def change
    add_monetize :carts, :total
  end
end
