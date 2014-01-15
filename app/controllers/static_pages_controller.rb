class StaticPagesController < ApplicationController
  def index
    @static_pages = StaticPage.all
  end

  def show
    @static_pages = StaticPage.find_by_id(params[:id])
  end

  def new
  end

  def create

  end

  def edit

  end

  def destroy

  end
end
