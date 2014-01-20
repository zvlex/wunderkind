class StaticPagesController < ApplicationController
  def show
    @static_pages = StaticPage.find_by_id(params[:id])
  end

  def index
    @static_pages = StaticPage.all
  end

end
