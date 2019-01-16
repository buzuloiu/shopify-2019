# This will guess the User class
FactoryBot.define do
  factory :product do
    title { "one" }
    price_cents  { 100 }
    price_currency { "USD" }
    inventory_count { 4 }
  end
end
