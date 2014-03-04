class CreatePaymentZones < ActiveRecord::Migration
  def change
    create_table :payment_zones do |t|
      t.string :zone_name_ge
      t.string :zone_name_en
      t.integer :country_id
      t.decimal :delivery_price

      t.timestamps
    end
  end
end
