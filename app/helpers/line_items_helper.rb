module LineItemsHelper
  def one_product_image(pid)
    Image.where('product_id = ?', pid).limit(1)
  end
end
