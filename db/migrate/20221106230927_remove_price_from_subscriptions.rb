class RemovePriceFromSubscriptions < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscriptions, :price, :float
  end
end
