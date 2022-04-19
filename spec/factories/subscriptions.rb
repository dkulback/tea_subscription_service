FactoryBot.define do
  factory :tea do
    name { Faker::Name.name }
    subscription_type { Faker::Name.name }
    caffeinated { Faker::Subscription.plan }
    description { Faker::Quote.famous_last_words }
    price { Faker::Number.between(from: 10.49, to: 30.99) }
  end
end
