class AddStripeUserFields < ActiveRecord::Migration
  def change
    add_column :users, :customer_id, :string, null: true, default: ''
    add_column :users, :plan, :string
    add_column :users, :plan_expiry, :datetime

    add_index :users, :customer_id, unique: true
  end
end
