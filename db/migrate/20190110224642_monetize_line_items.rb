class MonetizeLineItems < ActiveRecord::Migration[5.2]
  def change
    add_monetize :line_items, :unit_price
    add_monetize :line_items, :total_price
  end
end
