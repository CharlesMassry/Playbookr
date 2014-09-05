class ChangeCustomerToStripeCustomerId < ActiveRecord::Migration
  def change
    rename_column :users, :customer, :stripe_customer_id
  end
end
