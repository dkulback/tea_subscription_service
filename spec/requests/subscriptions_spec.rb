require 'rails_helper'

RSpec.describe 'API Subscriptions' do
  let(:headers) { { "Content-Type": 'application/json', "Accept": 'application/json' } }
  let(:customer) {  create(:customer) }
  let(:tea) { create(:tea) }
  let(:teas) { create_list(:tea, 4) }
  let(:valid_sub) { { tea_id: tea.id, plan: 'Monthly' } }
  let(:cancel_sub) { { status: 'cancelled' } }
  let(:customer_sub) { { customer_id: customer.id.to_s } }
  describe 'POST api/v1/subscriptions' do
    context 'when body is valid' do
      it 'returns a Subscription json and status 201' do
        post api_v1_customer_subscriptions_path(customer.id), headers: headers, params: JSON.generate(valid_sub)

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
        post api_v1_customer_subscriptions_path(customer.id), headers: headers, params: JSON.generate(valid_sub)

        errors = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(errors[:error]).to match('Validation failed: Customer has already been taken')
      end
    end
  end
  describe 'PATCH api/v1/subscriptions/:id' do
    context 'when body is valid' do
      it 'returns a Subscription json and status 200' do
        subscription = Subscription.create(
          customer_id: customer.id,
          tea_id: tea.id,
          plan: 'Monthly'
        )
        patch api_v1_customer_subscription_path(customer, subscription),
              headers: headers,
              params: JSON.generate(cancel_sub)

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
  describe 'GET api/v1/subscriptions' do
    context 'when body is valid' do
      it 'returns a Subscription json and status 200' do
        teas.size.times do |i|
          Subscription.create!(customer_id: customer.id,
                               tea_id: teas[i].id,
                               plan: 'Monthly')
        end

        get api_v1_customer_subscriptions_path(customer), headers: headers

        subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]
        subscription = subscriptions[0]
        expect(subscriptions.count).to eq(4)
        expect(subscription).to have_key(:type)
        expect(subscription).to have_key(:id)
        expect(subscription[:type]).to eq('subscription')
        expect(subscription[:id]).to be_a(Integer)

        expect(subscription[:attributes]).to have_key(:customer_id)
        expect(subscription[:attributes]).to have_key(:tea_id)
        expect(subscription[:attributes]).to have_key(:status)
        expect(subscription[:attributes]).to have_key(:price)
        expect(subscription[:attributes]).to have_key(:title)
        expect(subscription[:attributes]).to have_key(:plan)

        expect(subscription[:attributes][:customer_id]).to be_a(Integer)
        expect(subscription[:attributes][:tea_id]).to be_a(Integer)
        expect(subscription[:attributes][:price]).to be_a(Float)
        expect(subscription[:attributes][:title]).to be_a(String)
        expect(subscription[:attributes][:plan]).to be_a(String)

        expect(subscription[:attributes][:status]).to be_a(String)
      end
    end
  end
end
