class SubCategoriesController < ApplicationController

  def index
    @sub_categories = SubCategory.all
  end

  def show
    #@products = Product
    #  .joins('LEFT JOIN prefixes ON (products.prefix_id = prefixes.id)')
    #  .where('sub_category_id = ?', params[:id])
    #  .select('*')

    @prefixes = Prefix.joins('LEFT JOIN products ON (products.prefix_id = prefixes.id)')
                .where('sub_category_id = ?', params[:id]).group('prefixes.id').page(params[:page]).per(2)
    @sub_title = SubCategory.find(params[:id])

    #@image = Image.find_by_product_id()
  end


end
