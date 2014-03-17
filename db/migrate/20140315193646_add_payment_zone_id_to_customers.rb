class AddPaymentZoneIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :payment_zone_id, :integer
  end
end
