class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer
  enum status: %i[active cancelled paused]
  validates_uniqueness_of :customer_id, scope: :tea_id

  def title
    "#{customer.name}: #{tea.name}"
  end

  def price
    tea.price.round(2)
  end
end
