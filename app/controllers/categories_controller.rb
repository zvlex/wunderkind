class CategoriesController < ApplicationController
  attr_accessor :categories

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
  end
end
