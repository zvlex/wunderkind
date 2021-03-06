class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [ :new, :create, :show, :index ]
  #before_action :set_order, only: [ :show, :edit, :update, :destroy ]

  def index
    @orders = Order.all.where('customer_id = ?', current_customer.id).order('created_at DESC').page(params[:page]).per(10)
  end


  def new
    if @cart.line_items.empty?
      redirect_to products_url
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
    @user = User.first
    begin
      if authenticate_customer!
        @order = Order.find(params[:id])
        if @order.customer_id == current_customer.id
          @order_products = OrderProduct.where('order_id = ?', @order.id)
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
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
                product.discount * li.quantity
              end
      per_price = if product.discount == 0
                    product.price.to_f
                  else
                    product.discount
                  end

      op = OrderProduct.new(order_id: @order.id, product_id: li.product_id, title: product["title_#{get_loc}"],
                            model: product.model, quantity: li.quantity, total: total,
                            per_price: per_price)
      product.quantity -= li.quantity if op.save
      if product.save
        flash[:success] = t('orders.add')
      else
        flash[:error] = t('orders.remove')
      end
    end
  end

  def create
    #raise @cart.line_items.inspect
    @amount = Transaction.all.where('customer_id = ?', current_customer.id).sum('amount')
    session[:order_params].deep_merge!(params[:order]) if params[:order]
    @order = Order.new(session[:order_params])
    session[:order_product][:order_id] = @order.id
    @order.current_step = session[:order_step]
    if @order.valid?
      if params[:back_button]
        @order.previous_step
      elsif @order.last_step?
        # Online payment
        if @order.pay_type_id == 2
          # Amount check
          if @amount.to_f == 0
            flash[:error] = t('orders.no_money')
            redirect_to @cart
            return
          elsif @amount.to_f >= session[:order_params][:total].to_f
            minus_amount = (-1 * session[:order_params][:total].to_f)
            Transaction
              .create(customer_id: current_customer.id, order_id: @order.id, amount: minus_amount, status: 0,
                      payment_type: 0, payment_method: @order.pay_type_id, ux_code: '',
                      description: "Order ID: ##{@order.id}", bonus_xp: 0) if @order.save
            add_order_products
            clear_cart
          else
            flash[:error] = t('orders.no_money')
            redirect_to @cart
            return
          end
        else
          flash[:notice] = t('orders.add')
          @order.save
          add_order_products
        end
      else
        @order.next_step
      end
      session[:order_step] = @order.current_step
    end
    if @order.new_record?
      render 'new'
    else
      session[:order_step] = session[:order_params] = nil
      redirect_to @order
    end
  end
end
