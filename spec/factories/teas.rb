FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    caffeinated { Faker::Boolean.boolean }
    description { Faker::Coffee.notes }
    price { Faker::Number.between(from: 10.49, to: 30.99) }
  end
end
