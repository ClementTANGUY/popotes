class OrdersController < ApplicationController
  include CookCart

  before_action :set_cart

  before_action :cook_cart, only: [:new]

  before_action :ensure_cart_isnt_empty, only: [:new]

  def new
  end

  def create
    @order = Order.new
    @order.add_order_items_from_cart(@cart)
    respond_to do |format|
      if @order.save
        @order.remove_dish_portion
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to cooks_url, notice: "Merci pour votre commande ! Soyez ponctuel à l'adresse prévue" }
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_cart
      @cart = current_cart
    end

    def ensure_cart_isnt_empty
      if @cart.order_items.empty?
        redirect_to cooks_url, alert: 'Votre panier est vide'
      end
    end

    def order_params
      params.require(:order).permit(:subtotal, :charge, :total_amount)
    end

end
