class OrdersController < ApplicationController
  include CookCart

  skip_before_action :authenticate_user!

  before_action :cook_cart, only: [:new]

  before_action :set_cart

  before_action :ensure_cart_isnt_empty, only: [:new]

  def new
    if current_user
      # new instance with a logged user
      @order_si = Order.new
    else
      # new instance with an unlogged user
      @order_nsi = Order.new
    end
  end

  def create

  if current_user
    # logged user orders thanks to his account
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
    # unlogged user orders thanks to his first_name and email attributes
    @order_nsi = Order.new(order_params)

    # vaidations on Order model are so activated
    @order_nsi.not_signed_in = true

    # ensure that this user is not a cook ordering his own dishes
    user = User.find_by(email: @order_nsi.email)

    if !user.nil? && !user.cook.nil? && !user.cook.dishes.nil?
      order_items_dishes = @cart.order_items.collect { |order_item| order_item.dish_id }
      cook_dishes = user.cook.dishes.ids
      if !(order_items_dishes & cook_dishes).empty?
        reject_items = @cart.order_items.select { |h| cook_dishes.include? h['dish_id'] }
        reject_items.each do |reject_item|
          reject_item.destroy
        end
        flash[:alert] = "Argh ! On ne commande pas ses propres popotes..."
        redirect_to cart_url and return
      end
    end

    #order_items go from the current_cart to the order
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
