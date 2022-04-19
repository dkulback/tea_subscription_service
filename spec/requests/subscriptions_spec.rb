require 'rails_helper'

RSpec.describe 'API Subscriptions' do
  let(:headers) { { "Content-Type": 'application/json', "Accept": 'application/json' } }
  let(:customer) {  create(:customer)  }
  describe 'POST api/v1/subscriptions' do
    context 'when body is valid' do
      it 'returns a Subscription json and status 201' do
        post api_v1_subscriptions_path, headers: headers, params: JSON.generate(valid_sub)

        sub = JSON.parse(response.body, symbolize_names: true)
        expect(sub).to have_key(:data)
        expect(sub[:data]).to have_key(:id)
        expect(sub[:data][:attributes]).to have_key(:customer_id)
        expect(sub[:data][:attributes]).to have_key(:tea_id)
        expect(sub[:data][:attributes]).to have_key(:status)
        expect(sub[:data][:attributes]).to have_key(:price)
        expect(sub[:data][:attributes]).to have_key(:title)

        expect(sub[:data][:id]).to be_a(String)
        expect(sub[:data][:attributes][:customer_id]).to be_a(String)
        expect(sub[:data][:attributes][:tea_id]).to be_a(String)
        expect(sub[:data][:attributes][:price]).to be_a(Float)
        expect(sub[:data][:attributes][:status]).to be_a(Boolean)
        expect(sub[:data][:attributes][:title]).to be_a(String)

        expect(response).to have_http_status(201)
      end
    end
    context 'when subscription info isnt valid' do
      xit 'returns unprocessable entity, status 400, error response' do
        post api_v1_subscriptions_path, headers: headers, params: JSON.generate(invalid_sub)

        errors = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(errors[:errors]).to match(["Attribute can't be blank"])
      end
    end
  end
end
