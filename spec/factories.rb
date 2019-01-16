require 'faker'

FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    price_cents  { Faker::Number.number(4) }
    price_currency { "USD" }

    trait :in_stock do
      inventory_count { Faker::Number.number(2)}
    end

    trait :out_of_stock do
      inventory_count { 0 }
    end
  end

  factory :cart do
    
  end
end
