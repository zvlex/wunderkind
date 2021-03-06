class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id, quantity, c)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      if c
        current_item.quantity = quantity.to_i
      else
        current_item.quantity += quantity.to_i
      end
    else
      current_item = line_items.build(product_id: product_id, quantity: quantity.to_i)
    end

    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def items_quantity
    line_items.to_a.sum { |item| item.quantity }
  end

end
