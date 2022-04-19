class SubscriptionService
  def self.create_subscription(params)
    tea = Tea.find(params[:tea_id])
    customer = Customer.find(params[:customer_id])
    Subscription.create!(customer_id: params[:customer_id],
                         tea_id: params[:tea_id],
                         plan: params[:plan],
                         price: tea.price,
                         title: "#{customer.name}: #{tea.name}")
  end
end
