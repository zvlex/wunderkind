class PaymentMethod < ActiveRecord::Base
  def index
    @payment_methods = PaymentMethod.all
  end
end
