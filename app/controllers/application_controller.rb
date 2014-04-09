class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_i18n_locale_from_params
  helper_method :menu_items

  include CurrentCart
  before_action :set_cart

  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice]  = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end

    def menu_items
      { cat: @categories ||= Category.all, sub: @sub_categories ||= SubCategory.all }
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :address, :phone, :zip_code, :payment_zone_id, :pid]
      devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :address, :phone, :zip_code, :payment_zone_id, :pid]
    end

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

end
