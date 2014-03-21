class AddPerPriceToOrderProducts < ActiveRecord::Migration
  def change
    add_column :order_products, :per_price, :decimal, precision: 8, scale: 2
  end
end
