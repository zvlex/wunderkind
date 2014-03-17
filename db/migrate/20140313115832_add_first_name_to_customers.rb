class AddFirstNameToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :phone, :string
    add_column :customers, :address, :string
    add_column :customers, :town, :string
  end
end
