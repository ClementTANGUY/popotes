class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  after_action :store_action

  helper_method :current_cart

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:first_name, :picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :picture])
  end

  private

  def current_cart
    if !session[:cart_id].nil?
      Cart.find(session[:cart_id])
    else
      Cart.new
    end
    rescue ActiveRecord::RecordNotFound
      Cart.new
  end

  def store_action
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
