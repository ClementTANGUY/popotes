class OrdersController < ApplicationController
  include CookCart

  skip_before_action :authenticate_user!

  before_action :cook_cart

  before_action :set_cart

  before_action :ensure_cart_isnt_empty, only: [:new]

  def new
    if current_user
      # instance with a logged user
      @order_si = Order.new
    else
      # instance with an unlogged user
      @order_nsi = Order.new
    end
  end

  def create

  if current_user
    # user is logged in and order thanks to his account
    @order_si = Order.new
    @order_si.add_order_items_from_cart(@cart)
    @order_si.first_name = current_user.first_name
    @order_si.email = current_user.email
    respond_to do |format|
      if @order_si.save
        @order_si.remove_dish_portion
        OrderMailer.placed(@order_si, current_user).deliver_later
        @order_si.order_items.each do |order_item|
          @cook = order_item.dish.cook
          OrderMailer.received(@order_si, @cook, order_item).deliver_later
        end
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to cooks_url, notice: "Merci pour votre commande !" }
      else
        format.html { render :new }
      end
    end

  else
    # user is not logged in and order thanks to his first_name and email attributes, vaidations are so activated
    @order_nsi = Order.new(order_params)
    @order_nsi.not_signed_in = true
    @order_nsi.add_order_items_from_cart(@cart)
    respond_to do |format|
      if @order_nsi.save
        @order_nsi.remove_dish_portion
        OrderMailer.placed_without_logged_in(@order_nsi).deliver_later
        @order_nsi.order_items.each do |order_item|
          @cook = order_item.dish.cook
          OrderMailer.received(@order_nsi, @cook, order_item).deliver_later
        end
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to cooks_url, notice: "Merci pour votre commande !" }
      else
        format.html { render :new }
      end
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
      params.require(:order).permit(:first_name, :email)
    end

end
