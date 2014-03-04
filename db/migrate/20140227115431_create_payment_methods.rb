class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :method_name_ge
      t.string :method_name_en

      t.timestamps
    end
  end
end
