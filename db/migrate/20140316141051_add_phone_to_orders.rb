class AddPhoneToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :phone, :string
    add_column :orders, :pid, :string
  end
end
