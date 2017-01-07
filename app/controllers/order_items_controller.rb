class OrderItemsController < ApplicationController

  skip_before_action :authenticate_user!

  # before_action :set_order

  # before_action :set_order_item, except: [:create]

  def create
    @order = current_order
    @dish = Dish.find(params[:dish_id])
    @order_item = OrderItem.where("order_id = ? AND dish_id = ?", @order, @dish)
    respond_to do |format|
    if (@order_item.sum("quantity") < @dish.portion_count)
      @order_item = @order.order_items.new(dish_id: @dish.id, quantity: "1")
      @order.save
      session[:order_id] = @order.id
      format.html { flash[:notice] = "Plat ajouté à votre panier !" }
      format.js { flash[:notice] = "Plat ajouté à votre panier !" }
    else
      format.html { flash[:alert] = "Seulement #{@dish.portion_count} #{'portion'.pluralize(@dish.portion_count)} #{'disponible'.pluralize(@dish.portion_count)}" }
      format.js { flash[:alert] = "Seulement #{@dish.portion_count} #{'portion'.pluralize(@dish.portion_count)} #{'disponible'.pluralize(@dish.portion_count)}" }
    end
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)
    @order_items = @order.order_items

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # def set_order
    #   @order = current_order
    # end

    # def set_order_item
    #   @order_item = @order.order_items.find(params[:id])
    # end

    def order_item_params
      params.require(:order_item).permit(:quantity, :dish_id)
    end
end
