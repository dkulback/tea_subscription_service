class RemoveSubscriptionTypeFromTeas < ActiveRecord::Migration[5.2]
  def change
    remove_column :teas, :subscription_type, :string
  end
end
