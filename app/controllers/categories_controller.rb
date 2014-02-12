class CategoriesController < ApplicationController
  attr_accessor :categories

  def index
    @categories = Category.all

  end

  def show
    @category = Category.find_by_id(params[:id])
    @subs = SubCategory.where(category_id: @category.id)
    #@prod = Product.where(sub_category_id: [@subs.ids])
    #@brands = Brand.joins('LEFT JOIN products ON products.brand_id = brands.id').group('brands.id')
    @brands = Product.joins(:sub_category, :brand).select('brands.title_ge, brands.title_en, sub_categories.id as sub_id, COUNT(*) as prod_quantity').group('brands.id')


  end
end
