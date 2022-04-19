class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer
  enum status: %i[active cancelled paused]
  validates_uniqueness_of :customer_id, scope: :tea_id
end
