class CartsController < ApplicationController
  include CookCart

  skip_before_action :authenticate_user!

  before_action :set_cart

  before_action :cook_cart, only: [:show]

  def show
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to cooks_url, notice: 'Votre panier est vide'
  end

  private
    def set_cart
      @cart = current_cart
    end

end
