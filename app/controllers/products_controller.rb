class ProductsController < ApplicationController


  def index
    if params[:f]
      cond_1 = (params[:brand][:id] == [''] || params[:age][:id] == ['']) ? 'OR' : 'AND'
      cond_2 = (params[:sex][:id] == ['']) ? false : true
      cond_3 = (params[:brand][:id] == [''] && params[:age][:id] == [''] && params[:sex][:id]) ? true : false
      cond_4 = (params[:brand][:id] == [''] && params[:age][:id] == [''] && params[:sex][:id] == ['']) ? true : false

      #@products = if params[:sub_category]
      #              Product.joins('LEFT JOIN prefixes ON (prefixes.id = products.prefix_id)')
      #              .search_with_sub(params[:sub_category][:id], params[:brand][:id], params[:age][:id], params[:sex][:id], cond_1, cond_2, cond_3, cond_4, params[:price_min], params[:price_max]).page(params[:page]).per(1)
      #            else
      #              if cond_4
      #                Product.where('price BETWEEN ? AND ? AND quantity > 0',  params[:price_min],  params[:price_max]).page(params[:page])
      #              else
      #                Product
      #                .search_without_sub(params[:brand][:id], params[:age][:id], params[:sex][:id], cond_1, cond_2, cond_3, params[:price_min], params[:price_max]).page(params[:page]).per(2)
      #              end
      #            end

                  if params[:sub_category]
                    @prefixes = Prefix.joins('LEFT JOIN products ON (products.prefix_id = prefixes.id)')
                    .search_with_sub(params[:sub_category][:id], params[:brand][:id], params[:age][:id], params[:sex][:id], cond_1, cond_2, cond_3, cond_4, params[:price_min], params[:price_max])
                    .group('prefixes.id').select('*, products.id AS pid, prefixes.id AS pref_id').page(params[:page]).per(1)
                    @products = Product
                    .search_with_sub(params[:sub_category][:id], params[:brand][:id], params[:age][:id], params[:sex][:id], cond_1, cond_2, cond_3, cond_4, params[:price_min], params[:price_max]).select('*')

                  else
                    if cond_4
                      @prefixes = Prefix.joins('LEFT JOIN products ON (products.prefix_id = prefixes.id)').where('price BETWEEN ? AND ? AND quantity > 0',  params[:price_min],  params[:price_max])
                      .group('prefixes.id').select('*, products.id AS pid, prefixes.id AS pref_id').page(params[:page]).per(1)
                      @products = Product.where('price BETWEEN ? AND ? AND quantity > 0',  params[:price_min],  params[:price_max])
                    else
                      @prefixes = Prefix.joins('LEFT JOIN products ON (products.prefix_id = prefixes.id)')
                      .search_without_sub(params[:brand][:id], params[:age][:id], params[:sex][:id], cond_1, cond_2, cond_3, params[:price_min], params[:price_max])
                      .group('prefixes.id').select('*, products.id AS pid, prefixes.id AS pref_id').page(params[:page]).per(1)
                      @products = Product
                      .search_without_sub(params[:brand][:id], params[:age][:id], params[:sex][:id], cond_1, cond_2, cond_3, params[:price_min], params[:price_max])
                    end
                  end
    else
      @search = params[:search]
      if @search.blank?
        flash[:notice] = t('layouts.not_found')
        redirect_to root_url
      else
        if params[:locale] == 'en' || params[:locale] == 'ge'
          loc = params[:locale]
          @prefixes = Prefix.joins('LEFT JOIN products ON (products.prefix_id = prefixes.id)')
          .where("title_#{loc} LIKE ? OR prefix_#{loc}", "%#{params[:search]}%").group('prefixes.id').select('*, products.id AS pid, prefixes.id AS pref_id').page(params[:page]).per(2)
        end
      end
    end
  end


  def show
    @product = Product.find(params[:id])
    @prefix = Prefix.find(@product.prefix_id)
  end


end
