require 'rails_helper'

RSpec.describe 'API Subscriptions' do
  let(:headers) { { "Content-Type": 'application/json', "Accept": 'application/json' } }
  let(:customer) {  create(:customer) }
  let(:tea) { create(:tea) }
  let(:valid_sub) { { customer_id: customer.id, tea_id: tea.id, plan: 'Monthly' } }
  let(:cancel_sub) { { status: 'cancelled' } }
  describe 'POST api/v1/subscriptions' do
    context 'when body is valid' do
      it 'returns a Subscription json and status 201' do
        post api_v1_subscriptions_path, headers: headers, params: JSON.generate(valid_sub)

        sub = JSON.parse(response.body, symbolize_names: true)

        expect(sub).to have_key(:data)
        expect(sub[:data]).to have_key(:type)
        expect(sub[:data]).to have_key(:id)
        expect(sub[:data][:type]).to eq('subscription')
        expect(sub[:data][:id]).to be_a(Integer)

        expect(sub[:data][:attributes]).to have_key(:customer_id)
        expect(sub[:data][:attributes]).to have_key(:tea_id)
        expect(sub[:data][:attributes]).to have_key(:status)
        expect(sub[:data][:attributes]).to have_key(:price)
        expect(sub[:data][:attributes]).to have_key(:title)
        expect(sub[:data][:attributes]).to have_key(:plan)

        expect(sub[:data][:attributes][:customer_id]).to be_a(Integer)
        expect(sub[:data][:attributes][:tea_id]).to be_a(Integer)
        expect(sub[:data][:attributes][:price]).to be_a(Float)
        expect(sub[:data][:attributes][:status]).to eq('active')
        expect(sub[:data][:attributes][:title]).to be_a(String)
        expect(sub[:data][:attributes][:plan]).to be_a(String)

        expect(response).to have_http_status(201)
      end
    end
    context 'when subscription info isnt valid' do
      it 'returns unprocessable entity, status 400, error response' do
        Subscription.create(customer_id: customer.id, tea_id: tea.id)
        post api_v1_subscriptions_path, headers: headers, params: JSON.generate(valid_sub)

        errors = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(errors[:error]).to match('Validation failed: Customer has already been taken')
      end
    end
  end
  describe 'PATCH api/v1/subscriptions' do
    context 'when body is valid' do
      it 'returns a Subscription json and status 200' do
        subscription = Subscription.create(customer_id: customer.id,
                                           tea_id: tea.id,
                                           title: "#{customer.name}: #{tea.name}",
                                           price: tea.price,
                                           plan: 'Monthly')
        patch api_v1_subscription_path(subscription), headers: headers, params: JSON.generate(cancel_sub)

        sub = JSON.parse(response.body, symbolize_names: true)

        expect(sub).to have_key(:data)
        expect(sub[:data]).to have_key(:type)
        expect(sub[:data]).to have_key(:id)
        expect(sub[:data][:type]).to eq('subscription')
        expect(sub[:data][:id]).to be_a(Integer)

        expect(sub[:data][:attributes]).to have_key(:customer_id)
        expect(sub[:data][:attributes]).to have_key(:tea_id)
        expect(sub[:data][:attributes]).to have_key(:status)
        expect(sub[:data][:attributes]).to have_key(:price)
        expect(sub[:data][:attributes]).to have_key(:title)
        expect(sub[:data][:attributes]).to have_key(:plan)

        expect(sub[:data][:attributes][:customer_id]).to be_a(Integer)
        expect(sub[:data][:attributes][:tea_id]).to be_a(Integer)
        expect(sub[:data][:attributes][:price]).to be_a(Float)
        expect(sub[:data][:attributes][:title]).to be_a(String)
        expect(sub[:data][:attributes][:plan]).to be_a(String)

        expect(sub[:data][:attributes][:status]).to eq('cancelled')
        expect(response).to have_http_status(200)
      end
    end
  end
end
