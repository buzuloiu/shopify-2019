# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(title:  'dildo', price: 100, inventory_count: 4, in_stock: true)
Product.create(title:  'yeet', price: 99, inventory_count: 45, in_stock: true)
Product.create(title:  'yote', price: 45, inventory_count: 54, in_stock: true)
Product.create(title:  'lol', price: 40, inventory_count: 44, in_stock: true)
Product.create(title:  'hey', price: 69, inventory_count: 46, in_stock: true)
Product.create(title:  'sorry', price: 96, inventory_count: 49, in_stock: true)
Product.create(title:  'oops', price: 96, inventory_count: 0, in_stock: false)

Cart.create()

LineItem.create(cart_id: 1, product_id: 2, unit_price: 99, quantity: 1, total_price: 99)
LineItem.create(cart_id: 1, product_id: 3, unit_price: 45, quantity: 2, total_price: 90)
