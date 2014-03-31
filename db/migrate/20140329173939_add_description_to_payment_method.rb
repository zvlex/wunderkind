class AddDescriptionToPaymentMethod < ActiveRecord::Migration
  def change
    add_column :payment_methods, :description_ge, :text
    add_column :payment_methods, :description_en, :text
  end
end
