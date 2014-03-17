class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.integer :order_id
      t.integer :status
      t.integer :payment_method
      t.integer :payment_type
      t.string :ux_code
      t.string :description
      t.decimal :amount, precision: 8, scale: 2
      t.integer :bonus_xp, default: false
      t.string :comment


      t.timestamps
    end
  end
end
