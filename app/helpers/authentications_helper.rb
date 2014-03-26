module AuthenticationsHelper

  require 'pay_config'

  def return_hash_code(pay_hash)
    h = "#{pay_hash[:status]}#{pay_hash[:transactioncode]}#{pay_hash[:datestring]}#{pay_hash[:amount]}#{pay_hash[:currency]}#{pay_hash[:ordercode]}#{pay_hash[:paymethod]}#{pay_hash[:customdata]}#{pay_hash[:testmode]}#{PayConfig::MERCHANT_SECRET_KEY}"
    (Digest::SHA256.hexdigest h).upcase
  end

end
