module SubCategoriesHelper


  def product_list(pid)
    Product
      .where('sub_category_id = ?', params[:id]).where('prefix_id = ?', pid)
      .select('*')
  end




end
