class OrderItemsController < ApplicationController

  skip_before_action :authenticate_user!

  before_action :set_order

  before_action :set_order_item, except: [:create]

  def create
    dish = Dish.find(params[:dish_id])
    @order_item = @order.add_dish(dish)
    respond_to do |format|
      if (@order_item.quantity <= dish.portion_count)
        @order_item.save
        format.html { flash.now[:notice] = "Plat ajouté à votre panier !" }
        format.js { flash.now[:notice] = "Plat ajouté à votre panier !" }
      else
        format.html { flash.now[:alert] = "#{dish.portion_count} #{'portion'.pluralize(dish.portion_count)} #{'disponible'.pluralize(dish.portion_count)} !" }
        format.js { flash.now[:alert] = "#{dish.portion_count} #{'portion'.pluralize(dish.portion_count)} #{'disponible'.pluralize(dish.portion_count)} !" }
      end
    end
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_item.update(order_item_params)
    @order_items = @order.order_items
  end

  def increment
    dish = @order_item.dish
    respond_to do |format|
      if (@order_item.quantity < dish.portion_count)
        @order_item.update_attribute(:quantity, @order_item.quantity += 1)
        format.js
      else
        format.js { flash.now[:alert] = "#{dish.portion_count} #{'portion'.pluralize(dish.portion_count)} #{'disponible'.pluralize(dish.portion_count)} !" }
      end
    end
    @order_items = @order.order_items
  end

  def decrement
    respond_to do |format|
      if @order_item.quantity > 1
      @order_item.update_attribute(:quantity, @order_item.quantity -= 1)
      end
    format.js
    end
    @order_items = @order.order_items
  end

  def destroy
    @order_item.destroy
    @order_items = @order.order_items
  end

  private
    def set_order
      @order = current_order
    end

    def set_order_item
      @order_item = @order.order_items.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:quantity, :dish_id)
    end
end
