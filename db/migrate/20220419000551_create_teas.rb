class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :subscription_type
      t.boolean :caffeinated
      t.float :price

      t.timestamps
    end
  end
end
