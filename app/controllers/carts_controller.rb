class CartsController < ApplicationController

  skip_before_action :authenticate_user!

  def show
    @order_items = current_order.order_items
  end

end
