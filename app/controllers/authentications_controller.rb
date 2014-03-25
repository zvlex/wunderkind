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
   @h[:datestring]      = params[:datestring]
   @h[:amount]          = params[:amount]
   @h[:currency]        = params[:currency]
   @h[:ordercode]       = params[:ordercode]
   @h[:paymethod]       = params[:paymethod]
   @h[:customdata]      = params[:customdata]
   @h[:testmode]        = params[:status]
   @h[:check]           = params[:check]



    #respond_to do |format|
    #  format.xml # COMMENT THIS OUT TO USE YOUR CUSTOM XML RESPONSE INSTEAD  { render :xml => @capital_city }
    #end
    #render 'return_from_pay', layout: false
    respond_to do |format|
      format.html { @pay_hash = @h }
      #format.xml  { render 'return_from_pay', layout: false }
    end
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
    respond_to do |format|
      format.html { @amount = params[:pay][:amount] }
    end
  end
end
