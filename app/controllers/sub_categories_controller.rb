class SubCategoriesController < ApplicationController
  def index
    @sub_categories = SubCategory.all
  end

  def show
    #@products = Product
    #  .joins('LEFT JOIN prefixes ON (products.prefix_id = prefixes.id)')
    #  .where('sub_category_id = ?', params[:id])
    #  .select('*')

    @prefixes = Prefix.joins('INNER JOIN products ON (products.prefix_id = prefixes.id)').where('sub_category_id = ?', params[:id]).group('prefixes.id')

  end

end
