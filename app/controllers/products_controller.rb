class ProductsController < ApplicationController


  def index
    unless params[:search].blank?
      if params[:locale] == 'en' || params[:locale] == 'ge'
        loc = params[:locale]
        @products = Product.where("title_#{loc} LIKE ?", "%#{params[:search]}%")
      end
    end

    if params[:f]
      cond_1 = (params[:brand][:id] == [''] || params[:age][:id] == ['']) ? 'OR' : 'AND'
      cond_2 = (params[:sex][:id] == ['']) ? false : true
      cond_3 = (params[:brand][:id] == [''] && params[:age][:id] == [''] && params[:sex][:id]) ? true : false
      cond_4 = (params[:brand][:id] == [''] && params[:age][:id] == [''] && params[:sex][:id] == ['']) ? true : false



      @products = if params[:sub_category]
        Product
        .search_with_sub(params[:sub_category][:id], params[:brand][:id], params[:age][:id], params[:sex][:id], cond_1, cond_2, cond_3, cond_4)
      else
        Product
        .search_without_sub(params[:brand][:id], params[:age][:id], params[:sex][:id], cond_1, cond_2, cond_3, params[:price_min], params[:price_max])
      end
    end
  end


  def show
    @product = Product.find(params[:id])
    @prefix = Prefix.find(@product.prefix_id)
  end


end
