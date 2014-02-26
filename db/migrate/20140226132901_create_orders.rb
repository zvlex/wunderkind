class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :invoice
      t.string :store_name
      t.string :store_url
      t.integer :customer_id
      t.string :first_name
      t.string :last_name
      t.string :payment_address
      t.integer :payment_zone
      t.integer :pay_type
      t.string :comment
      t.decimal :total
      t.string :ip

      t.timestamps
    end
  end
end
