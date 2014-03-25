class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [ :new, :create ]
  #before_action :set_order, only: [ :show, :edit, :update, :destroy ]

  def index
    @orders = Order.all.where('customer_id = ?', current_customer.id).order('created_at DESC').page(params[:page]).per(2)
  end


  def new
    if @cart.line_items.empty?
      redirect_to products_url, notice: 'Your cart is empty'
      return
    end

    if customer_signed_in?
      session[:order_params] ||= {}
      session[:order_product] ||= {}
      @order = Order.new(session[:order_params])
      @order.current_step = session[:order_step]
    else
      redirect_to "/customers/sign_in?locale=#{get_loc}"
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where('order_id = ?', @order.id)
  end

  def get_loc
    params[:locale] ||= 'ge'
  end

  def add_order_products
    @cart.line_items.each do |li|
      product = Product.find(li.product_id)
      total = if product.discount == 0
                product.price * li.quantity
              else
                (product.price - product.discount).to_f * li.quantity
              end
      per_price = if product.discount == 0
                    product.price.to_f
                  else
                    (product.price - product.discount).to_f
                  end

      op = OrderProduct.new(order_id: @order.id, product_id: li.product_id, title: product["title_#{get_loc}"],
                            model: product.model, quantity: li.quantity, total: total,
                            per_price: per_price)
      product.quantity -= li.quantity if op.save
      product.save
    end
  end

  def create
    #raise @cart.line_items.inspect
    @amount = Transaction.all.where('customer_id = ?', current_customer.id).sum('amount')
    session[:order_params].deep_merge!(params[:order]) if params[:order]
    @order = Order.new(session[:order_params])
    session[:order_product][:order_id] = @order.id
    @order.current_step = session[:order_step]
      if params[:back_button]
        @order.previous_step
      elsif @order.last_step?
        # Online payment
        if @order.pay_type_id == 1
          # Amount check
          if @amount.to_f == 0
            flash[:notice] = 'No money'
            redirect_to @cart
            return
          elsif @amount.to_f >= session[:order_params][:total].to_f
            Transaction.create(customer_id: current_customer.id, order_id: 0, amount: -(session[:order_params][:total].to_f)) if @order.save
            add_order_products
            clear_cart
          else
            flash[:notice] = 'You have not enough money'
            redirect_to @cart
            return
          end
        else
          flash[:notice] = 'Order saved'
          @order.save
          add_order_products
        end
      else
        @order.next_step
      end
      session[:order_step] = @order.current_step
    if @order.new_record?
      render 'new'
    else
      session[:order_step] = session[:order_params] = nil
      redirect_to @order
    end
  end
end