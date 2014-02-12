module SubCategoriesHelper

  def products_list(pid)
    @products = Product
      .where('sub_category_id = ?', params[:id]).where('prefix_id = ?', pid)
      .select('*')
  end
end
