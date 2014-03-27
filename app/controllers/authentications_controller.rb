class AuthenticationsController < ApplicationController

  def index
    @authentications = Authentication.all
  end

  def create
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      redirect_to authentications_url, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end

  def return_from_pay
   @h = {}
   @h[:status]          = params[:status]
   @h[:transactioncode] = params[:transactioncode]
   @h[:datestring]      = params[:date]
   @h[:amount]          = params[:amount]
   @h[:currency]        = params[:currency]
   @h[:ordercode]       = params[:ordercode]
   @h[:paymethod]       = params[:paymethod]
   @h[:customdata]      = params[:customdata]
   @h[:testmode]        = params[:testmode]
   @h[:check]           = params[:check]
   @pay_hash = @h

   render 'return_from_pay', layout: false
  end

  def show; end
  def home; end

  def facebook
    #raise omni = request.env["omniauth.auth"].inspect
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect Customer.find(authentication.customer_id)
    elsif current_customer
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret

      current_customer.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_customer
    else
      customer = Customer.new
      customer.email = omni['extra']['raw_info'].email
      customer.first_name = omni['extra']['raw_info'].first_name
      customer.last_name = omni['extra']['raw_info'].last_name
      #raise omni.inspect
      customer.apply_omniauth(omni)

      if customer.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect Customer.find(customer.id)
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_customer_registration_path
      end
    end
  end

  def pay
    check = nil
    amount = (params[:pay][:amount].to_i * 100).to_s
    order_hash = order_code_hash
    if check_code_hash(amount, order_hash).frozen?
      check ''
    else
      check = check_code_hash(amount, order_hash)
    end

    respond_to do |format|
      format.html {
        @pay_h = { check_code: check, amount: amount, order_hash: order_hash, customer_name: customer_name }
      }
    end
  end

  def order_code_hash
    SecureRandom.uuid.split('-').join
  end

  def customer_name
    customer = Customer.find(current_customer.id)
    customer.first_name + ' ' + customer.last_name
  end


  def check_code_hash(amount, order_hash)
    customer_id = current_customer.id
    h = "#{PayConfig::MERCHANT_SECRET_KEY}#{PayConfig::MERCHANT_NAME}#{order_hash}#{amount}#{PayConfig::CURRENCY}#{PayConfig::DESCRIPTION}#{customer_name}#{customer_id}#{PayConfig::LANG}#{PayConfig::TEST_MODE_ON}#{PayConfig::ISPREAUTH_NO}"
    (Digest::SHA256.hexdigest h).upcase
  end


  def callback
    @callback = {}
    @callback[:status]          = params[:status]
    @callback[:transactioncode] = params[:transactioncode]
    @callback[:amount]          = params[:amount]
    @callback[:currency]        = params[:currency]
    @callback[:ordercode]       = params[:ordercode]
    @callback[:paymethod]       = params[:paymethod]
    @callback[:customdata]      = params[:customdata]
    @callback[:testmode]        = params[:testmode]
    @callback[:check_code]      = params[:check]


    if @callback[:check_code].nil?
      @callback[:check_code] = ''
    end

    callback_hash_code = callback_hash(@callback)
    log('String for checksum', "#{@callback[:check_code]}", @callback[:transactioncode], '')
    log('Calculated checksum', callback_hash_code.to_s, @callback[:transactioncode], '')

    @g_xml = if @callback[:check_code].upcase != callback_hash_code
      generate_xml(-3, error_codes(-3), 'Checksum error - check hash', @callback[:transactioncode])
    else
      if check_transaction(@callback[:transactioncode])
                 save_order(@callback[:transactioncode], @callback[:amount])
                 generate_xml(0, error_codes(0), 'Ok', @callback[:transactioncode])
               else
                 generate_xml(1, error_codes(1), 'This transaction code repeted', @callback[:transactioncode])
               end
    end
    render :xml => @g_xml
  end



  def generate_xml(result_code, result_desc, description, transaction_code)
    check = result_hash(result_code, result_desc, transaction_code)
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.result {
        xml.resultcode result_code
        xml.resultdesc result_desc
        xml.check check
        xml.data description
      }
    end
    log('Generate XML code', '', transaction_code, builder.to_xml)
    builder.to_xml
  end

  def result_hash(result_code, result_desc, transaction_code)
    h = "#{result_code}#{result_desc}#{transaction_code}#{PayConfig::MERCHANT_SECRET_KEY}"
    (Digest::SHA256.hexdigest h).upcase
  end

  def error_codes(code)
    errors = {
        0 => 'Ok', :'1' => 'Duplicate transaction',
        -1 => 'Technical problem',
        -2 => 'Order has been cancelled',
        -3 => 'Error in parameter(s)'
    }
    errors[code]
  end


  def callback_hash(pay_hash)
    h = "#{pay_hash[:status]}#{pay_hash[:transactioncode]}#{pay_hash[:amount]}#{pay_hash[:currency]}#{pay_hash[:ordercode]}#{pay_hash[:paymethod]}#{pay_hash[:customdata]}#{pay_hash[:testmode]}#{PayConfig::MERCHANT_SECRET_KEY}"
    (Digest::SHA256.hexdigest h).upcase
  end

  def log(description, h_code, transaction_code, g_xml)
    l = Logs.new(customer_id: current_customer.id, description: description, h_code: h_code, transaction_code: transaction_code, g_xml: g_xml)
    if l.save
      true
    else
      generate_xml(-1, error_codes(-1), 'Can not write to log', transaction_code)
    end
  end

  def check_transaction(transaction_code)
    transaction = Transaction.where('ucode = ?', transaction_code)
    if transaction.blank?
      true
    else
      false
    end
  end

  def save_order(transaction_code, amount)
    amount = amount.to_f
    Transaction.new(customer_id: current_customer.id, status: '', payment_type: '1',
                    ucode: transaction_code, description: 'Pay.ge Online Payment', amount: amount, bonus_xp: '0')
  end
end
