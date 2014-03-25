module AuthenticationsHelper

  require 'pay_config'

  def order_code_hash
    SecureRandom.uuid.split('-').join
  end

  def customer_name
    customer = Customer.find(current_customer.id)
    customer.first_name + ' ' + customer.last_name
  end

  def return_hash_code(pay_hash)
    h = pay_hash[:status]
      .concat(pay_hash[:transactioncode]).concat(pay_hash[:datestring]).concat(pay_hash[:amount])
      .concat(pay_hash[:currency]).concat(pay_hash[:ordercode]).concat(pay_hash[:paymethod])
      .concat(pay_hash[:customdata]).concat(pay_hash[:testmode])
      #.concat(PayConfig::MERCHANT_SECRET_KEY)

  end


  def check_code_hash(amount, order_hash)

      #@h = ''
      customer_id = current_customer.id
      amount = (amount.to_i * 100).to_s

        #secret_key = 'W6ZwSBpnQiu4hQZc7wx9'
        h = PayConfig::MERCHANT_SECRET_KEY.concat(PayConfig::MERCHANT_NAME).concat(order_hash).concat(amount.to_s).concat(PayConfig::CURRENCY)
        .concat(PayConfig::DESCRIPTION).concat(customer_name).concat(customer_id.to_s)
        .concat(PayConfig::LANG).concat(PayConfig::TEST_MODE_ON.to_s).concat(PayConfig::ISPREAUTH_NO.to_s)
        (Digest::SHA256.hexdigest h).upcase
        #PayConfig::MERCHANT_SECRET_KEY.inspect
    [h, h.object_id]
  end
end
