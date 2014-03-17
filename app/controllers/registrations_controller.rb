class RegistrationsController < ApplicationController
  def create
    super
    session[:omniauth] = nil unless @customer.new_record?
  end

  def build_resource(*args)
    super
    if session[:omniauth]
      @customer.apply_omniauth(session[:omniauth])
      @customer.valid?
    end
  end
end
