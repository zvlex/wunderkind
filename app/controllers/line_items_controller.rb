class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  #before_action :set_line_item, only: [:show, :edit, :update, :destroy]

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
    c = params[:c]
    @line_item = @cart.add_product(product.id, quantity, c) if product.quantity > 0

    respond_to do |format|
      if @line_item.save
        @line_item.destroy if @line_item.quantity == 0
        format.html { redirect_to @line_item.cart, notice: t('line_items.create.line_item_created') }
        format.js { @c = c, flash[:success] = t('line_items.create.line_item_created') }
        format.json { render json: @cart, status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def new; end
  def edit; end
  def update; end


  def destroy
    @line_item = LineItem.find(params[:id])
    @cart = current_cart
    begin
      @line_item.destroy
      flash[:notice] = t('products.show.line_item_removed')
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to cart_path(@cart) }
      format.json { head :no_content }
    end

  end


  def update_quantity; end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end

end
