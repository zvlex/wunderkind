class LineItemsController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end


  def create
    product = Product.find(params[:product_id])
    quantity = params[:quantity]
    @line_item = @cart.add_product(product.id, quantity)

    respond_to do |format|
      if @line_item.save
        #format.html { redirect_to @line_item.cart, notice: "#{params.inspect}" }
        #format.html { redirect_to @line_item.cart, notice: t('line_items.create.line_item_created') }
        format.js
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def new; end
  def edit; end
  def update; end
  def destroy; end
  def update_quantity; end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end

end
