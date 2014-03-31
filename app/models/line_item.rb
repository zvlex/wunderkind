class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart


  def total_price
    if product.discount == 0
      product.price * quantity
    else
      product.discount * quantity
    end
  end

  def per_item_price
    if product.discount == 0
      product.price
    else
      product.discount
    end
  end

end
