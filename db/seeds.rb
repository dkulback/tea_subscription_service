# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
require 'faker'
include FactoryBot::Syntax::Methods
Customer.destroy_all
Tea.destroy_all
Subscription.destroy_all

customer = FactoryBot.create(:customer)
teas = FactoryBot.create_list(:tea, 10)

teas.size.times do |i|
  Subscription.create(customer_id: customer.id,
                      tea_id: teas[i].id,
                      title: "#{customer.name}: #{teas[i].name}",
                      price: teas[i].price.round(2),
                      plan: %w[Monthly Weekly BiWeekly Year].sample,
                      status: [0, 1].sample)
end
FactoryBot.create_list(:tea, 100)
