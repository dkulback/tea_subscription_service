class AddTypeToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :plan, :string
  end
end
