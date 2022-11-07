class SubscriptionService
  def self.create_subscription(params)
    Subscription.create!(customer_id: params[:customer_id],
                         tea_id: params[:tea_id],
                         plan: params[:plan])
  end
end
