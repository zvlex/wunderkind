class AddPidToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :pid, :string
  end
end
