FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    caffeinated { Faker::Boolean.boolean }
    subscription_type { Faker::Subscription.plan }
    description { Faker::Quote.famous_last_words }
    price { Faker::Number.between(from: 10.49, to: 30.99) }
  end
end
