class ProductsController < ApplicationController

  def index

  end

  def show
    @product = Product.find(params[:id])
    @prefix = Prefix.find(@product.prefix_id)
  end
end
