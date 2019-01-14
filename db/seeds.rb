# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(title:  'dildo',  price_cents: 100, price_currency: "USD", inventory_count: 4)
Product.create(title:  'yeet',  price_cents: 99, price_currency: "USD", inventory_count: 45)
Product.create(title:  'yote',  price_cents: 45, price_currency: "USD", inventory_count: 54)
Product.create(title:  'lol',  price_cents: 40, price_currency: "USD", inventory_count: 44)
Product.create(title:  'hey',  price_cents: 69, price_currency: "USD", inventory_count: 46)
Product.create(title:  'sorry',  price_cents: 96, price_currency: "USD", inventory_count: 49)
Product.create(title:  'oops',  price_cents: 96, price_currency: "USD", inventory_count: 0)

Cart.create()

LineItem.create(cart_id: 1, product_id: 2, unit_price_cents: 99, total_price_currency: "USD", quantity: 1, total_price_cents: 99, unit_price_currency: "USD")
LineItem.create(cart_id: 1, product_id: 3, unit_price_cents: 45, total_price_currency: "USD",quantity: 2, total_price_cents: 90, unit_price_currency: "USD")
