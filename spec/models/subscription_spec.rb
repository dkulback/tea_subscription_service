require 'rails_helper'

RSpec.describe Subscription do
  describe 'relationships' do
    it { should belong_to(:tea) }
    it { should belong_to(:customer) }
  end
  describe 'validations' do
    it 'wont create a valid record if a subscription exists with that customer and tea' do
      customer = create(:customer)
      customer2 = create(:customer)

      tea = create(:tea)
      Subscription.create!(customer_id: customer.id, tea_id: tea.id)
      subscription = Subscription.new(customer_id: customer.id, tea_id: tea.id)
      subscription2 = Subscription.new(customer_id: customer2.id, tea_id: tea.id)
      expect(subscription).to_not be_valid
      expect(subscription.errors.full_messages[0]).to eq('Customer has already been taken')
      expect(subscription2).to be_valid
    end
  end
  describe '#title' do
    it 'returns the subscriptions customer and tea names' do
      tea = create(:tea)
      customer = create(:customer)
      sub = Subscription.create!(customer_id: customer.id, tea_id: tea.id)
      actual = sub.title
      expected = "#{customer.name}: #{tea.name}"
      expect(actual).to eq(expected)
    end
  end
  describe '#price' do
    it 'returns the subscriptions tea price' do
      tea = create(:tea)
      customer = create(:customer)
      sub = Subscription.create!(customer_id: customer.id, tea_id: tea.id)
      actual = sub.price
      expected = sub.tea.price.round(2)
      expect(actual).to eq(expected)
    end
  end
end
