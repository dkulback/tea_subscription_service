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
end
