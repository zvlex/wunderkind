class StaticPagesController < ApplicationController
  def show
    @static_page = StaticPage.find_by_id(params[:id])
  end

  def index
    @static_pages = StaticPage.all
  end

end
