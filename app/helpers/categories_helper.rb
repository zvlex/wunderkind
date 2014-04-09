module CategoriesHelper
  def cat_product_list(pid)
    Product
    .where('brand_id = ? AND quantity > 0', params[:id]).where('prefix_id = ?', pid)
    .select('*')
  end

end
