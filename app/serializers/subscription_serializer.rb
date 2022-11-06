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

  def self.all_subscriptions(subs)
    {
      "data": subs.map do |sub|
        {
          "type": 'subscription',
          "id": sub.id,
          "attributes": {
            "customer_id": sub.customer_id,
            "tea_id": sub.tea_id,
            "plan": sub.plan,
            "status": sub.status,
            "title": sub.title,
            "price": sub.price
          }
        }
      end

    }
  end
end
