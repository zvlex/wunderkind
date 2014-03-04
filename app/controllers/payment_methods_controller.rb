class PaymentMethodsController < ApplicationController
  def index
    @payment_methods = PaymentMethod.all
  end
end
