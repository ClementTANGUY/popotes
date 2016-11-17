class OrderItemsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:create, :update, :destroy]

  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private
    def set_order
      @order = current_order
    end

    def order_item_params
      params.require(:order_item).permit(:quantity, :dish_id)
    end

end
