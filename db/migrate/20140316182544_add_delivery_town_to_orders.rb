class AddDeliveryTownToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_town, :decimal, precision: 8, scale: 2
  end
end
