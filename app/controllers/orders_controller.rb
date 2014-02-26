class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart,only: [ :new, :create ]
  before_action :set_order, only: [ :show, :edit, :update, :destroy ]

  def new
    @order = Order.new
  end


end
