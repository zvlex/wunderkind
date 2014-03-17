class AddZipCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :zip_code, :string
  end
end
