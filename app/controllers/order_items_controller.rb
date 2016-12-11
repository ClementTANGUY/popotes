class OrderItemsController < ApplicationController

  skip_before_action :authenticate_user!

  before_action :set_order

  before_action :set_order_item, except: [:create]

  def create
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @order_item.update(order_item_params)
    @order_items = @order.order_items

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @order_item.destroy
    @order_items = @order.order_items

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def set_order
      @order = current_order
    end

    def set_order_item
      @order_item = @order.order_items.find(params[:id])
    end


    def order_item_params
      params.require(:order_item).permit(:dish_id, :quantity)
    end

end
