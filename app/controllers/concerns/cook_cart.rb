module CookCart

  private
    def cook_cart
      # if a cook is the current_user, ensure that an order_item in current_cart is not referencing his own dishes
      if user_signed_in? && !current_user.cook.nil? && !current_user.cook.dishes.nil?
        order_items = current_cart.order_items
        order_items_dishes = order_items.collect { |order_item| order_item.dish_id }
        cook_dishes = current_user.cook.dishes.ids

        # order_items are all cook's dishes
          # if (order_items_dishes - cook_dishes).empty?
          #   Cart.destroy(session[:cart_id])
          #   session[:cart_id] = nil
          #   redirect_to root_url, alert: "Vous ne pouvez commander vos propres popotes !"

        #order_items contain cook's dishes
        if !(order_items_dishes & cook_dishes).empty?
          reject_items = order_items.select { |h| cook_dishes.include? h['dish_id'] }
          reject_items.each do |reject_item|
            reject_item.destroy
          end
          flash[:alert] = "Vous ne puvez commander vos propres popotes..."
          redirect_to cart_url and return
        else
          @order_items = current_cart.order_items
        end
      else
        @order_items = current_cart.order_items
      end
    end

end
