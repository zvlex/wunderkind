module SubCategoriesHelper

  def product_list(pid)
    Product
      .where('sub_category_id = ?', params[:id]).where('prefix_id = ?', pid)
      .select('*')
  end

  def product_image(pid)
    Image.where('product_id = ?', pid).limit(1)
  end
end
