class OrderItemsController < ApplicationController

  skip_before_action :authenticate_user!

  before_action :set_cart

  before_action :set_order_item, except: [:create]

  def create
    dish = Dish.find(params[:dish_id])
    @order_item = @cart.order_items.find_by(dish_id: dish.id)

    respond_to do |format|
      if (@order_item && @order_item.quantity < dish.portion_count)
        @order_item.quantity += 1
        @order_item.save
        format.html { redirect_back fallback_location: cooks_url, notice: "Plat ajouté à votre panier !" }
        format.js { flash.now[:notice] = "Plat ajouté à votre panier !" }

      elsif (@order_item && @order_item.quantity == dish.portion_count) || (!@order_item && dish.portion_count == 0)
        format.html { redirect_back fallback_location: cooks_url, alert: "#{dish.portion_count} #{helpers.pluralize_with_0('portion', dish.portion_count)} #{helpers.pluralize_with_0('disponible', dish.portion_count)} !" }
        format.js { flash.now[:alert] = "#{dish.portion_count} #{helpers.pluralize_with_0('portion', dish.portion_count)} #{helpers.pluralize_with_0('disponible', dish.portion_count)} !" }

      elsif (!@order_item && dish.portion_count != 0)
        @order_item = @cart.order_items.build(dish_id: dish.id, quantity: "1")
        @order_item.save
        format.html { redirect_back fallback_location: cooks_url, notice: "Plat ajouté à votre panier !" }
        format.js { flash.now[:notice] = "Plat ajouté à votre panier !" }
      end
    end

    @cart.save
    session[:cart_id] = @cart.id
  end

  # def update
  #   @order_item.update(order_item_params)
  #   @order_items = @cart.order_items
  # end

  def increment
    dish = @order_item.dish
    respond_to do |format|
      if (@order_item.quantity < dish.portion_count)
        @order_item.update_attribute(:quantity, @order_item.quantity += 1)
        format.html { redirect_back fallback_location: cooks_url }
        format.js
      else
        format.html { redirect_back fallback_location: cooks_url, alert: "#{dish.portion_count} #{helpers.pluralize_with_0('portion', dish.portion_count)} #{helpers.pluralize_with_0('disponible', dish.portion_count)} !" }
        format.js { flash.now[:alert] = "#{dish.portion_count} #{helpers.pluralize_with_0('portion', dish.portion_count)} #{helpers.pluralize_with_0('disponible', dish.portion_count)} !" }
      end
    end
    @order_items = @cart.order_items
  end

  def decrement
    respond_to do |format|
      if @order_item.quantity > 1
        @order_item.update_attribute(:quantity, @order_item.quantity -= 1)
        format.html { redirect_back fallback_location: cooks_url }
        format.js
      else
        @order_item.destroy
        format.html { redirect_back fallback_location: cooks_url, alert: "Popote supprimée de votre panier !" }
        format.js { flash.now[:alert] = "Popote supprimée de votre panier !" }
      end
    end
    @order_items = @cart.order_items
  end

  def destroy
    @order_item.destroy
    @order_items = @cart.order_items
  end

  private
    def set_cart
      @cart = current_cart
    end

    def set_order_item
      @order_item = @cart.order_items.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:quantity, :dish_id)
    end
end
