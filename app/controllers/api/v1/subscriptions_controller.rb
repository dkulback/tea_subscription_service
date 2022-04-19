class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = SubscriptionService.create_subscription(params)
    render json: SubscriptionSerializer.subscription(subscription), status: :created
  end
end
