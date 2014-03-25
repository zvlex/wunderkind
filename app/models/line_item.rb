class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart


  def total_price
    if product.discount == 0
      product.price * quantity
    else
      (product.price - product.discount).to_f * quantity
    end
  end

  def per_item_price
    if product.discount == 0
      product.price
    else
      (product.price - product.discount).to_f
    end
  end

end
