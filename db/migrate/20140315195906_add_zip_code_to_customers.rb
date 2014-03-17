class AddZipCodeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :zip_code, :string
  end
end
