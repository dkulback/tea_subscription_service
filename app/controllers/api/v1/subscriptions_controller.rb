class Api::V1::SubscriptionsController < ApplicationController
  before_action :find_subscription, only: :update
  def index
    subscriptions = Subscription.where(customer_id: params[:customer_id])
    render json: SubscriptionSerializer.all_subscriptions(subscriptions)
  end

  def create
    subscription = SubscriptionService.create_subscription(params)
    render json: SubscriptionSerializer.subscription(subscription), status: :created
  end

  def update
    @subscription.update(status: params[:status])

    render json: SubscriptionSerializer.subscription(@subscription), status: :ok
  end

  private

  def find_subscription
    @subscription = Subscription.find(params[:id])
  end
end
