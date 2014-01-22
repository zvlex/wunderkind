class SubCategoriesController < ApplicationController
  def index
    @sub_categories = SubCategory.all
  end

  def show
    @sub_category = SubCategory.find(params[:id])
  end

end
