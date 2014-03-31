class AddImgLinkToPaymentMethod < ActiveRecord::Migration
  def change
    add_column :payment_methods, :img_link, :string
  end
end
