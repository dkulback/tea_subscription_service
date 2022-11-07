class RemoveTitleFromSubscriptions < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscriptions, :title, :string
  end
end
