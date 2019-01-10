class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :product, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer :quantity
      t.integer :total_price
      t.integer :unit_price

      t.timestamps
    end
  end
end
