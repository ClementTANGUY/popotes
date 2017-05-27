class OrdersController < ApplicationController
  include CookCart

  skip_before_action :authenticate_user!

  before_action :cook_cart

  before_action :set_cart

  before_action :ensure_cart_isnt_empty, only: [:new]

  def new
    if !current_user
      @order = Order.new
    end
  end

  def create
    if current_user
      @order = Order.new
    else
      @order = Order.new(order_params)
    end
    @order.add_order_items_from_cart(@cart)
    respond_to do |format|
      if @order.save
        @order.remove_dish_portion
        if current_user
          OrderMailer.placed(@order, current_user).deliver_later
        else
          OrderMailer.placed_without_logged_in(@order).deliver_later
        end
        @order.order_items.each do |order_item|
          @cook = order_item.dish.cook
          OrderMailer.received(@order, @cook, order_item).deliver_later
        end
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to cooks_url, notice: "Merci pour votre commande !" }
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
      params.require(:order).permit(:first_name, :email, :subtotal, :charge, :total_amount)
    end

end
