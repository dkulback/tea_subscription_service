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
          "title": "#{subscription.customer.name}:
        #{subscription.tea.name}",
          "price": subscription.tea.price.round(2)
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
            "title": "#{sub.customer.name}:
                      #{sub.tea.name}",
            "price": sub.tea.price
          }
        }
      end

    }
  end
end
