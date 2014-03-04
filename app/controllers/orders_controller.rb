class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart,only: [ :new, :create ]
  before_action :set_order, only: [ :show, :edit, :update, :destroy ]

  def index
    @order = Order.all
  end



  def new
    if @cart.line_items.empty?
      redirect_to products_url, notice: 'Your cart is empty'
      return
    end
    session[:order_params] ||= {}
    @order = Order.new(session[:order_params])
    @order.current_step = session[:order_step]
  end


  def create
    session[:order_params].deep_merge!(params[:order]) if params[:order]
    @order = Order.new(session[:order_params])
    @order.current_step = session[:order_step]
    if params[:back_button]
      @order.previous_step
    elsif @order.last_step?
      @order.save
    else
      @order.next_step
    end
    session[:order_step] = @order.current_step

    if @order.new_record?
      render 'new'
    else
      session[:order_step] = session[:order_params] = nil
      flash[:notice] = "Order saved"
      redirect_to @order
    end

  end

end
