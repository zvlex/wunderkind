class BrandsController < ApplicationController
  def index
    @banners = Banner.all
  end

  def show
    @brand = Brand.find(params[:id])

    @prefixes = Prefix.joins('LEFT JOIN products ON (products.prefix_id = prefixes.id)')
    .where('brand_id = ?', params[:id]).group('prefixes.id').page(params[:page]).per(1)
  end
end
