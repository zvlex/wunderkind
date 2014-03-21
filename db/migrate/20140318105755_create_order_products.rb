class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :title
      t.string :model
      t.integer :quantity
      t.decimal :total, precision: 8, scale: 2
      t.decimal :delivery_tax, precision: 8, scale: 2
      t.string :comment

      t.timestamps
    end
  end
end
