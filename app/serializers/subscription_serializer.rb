class SubscriptionSerializer
  def self.subscription(subscription)
    {
      "data": {
        "type": 'subscription',
        "id": subscription.id,
        "attributes": {
          "customer_id": subscription.customer_id,
          "tea_id": subscription.tea_id,
          "plan": subscription.plan,
          "status": subscription.status,
          "title": subscription.title,
          "price": subscription.price
        }
      }
    }
  end
end
