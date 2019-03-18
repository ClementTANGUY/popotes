class CooksController < ApplicationController

    skip_before_action :authenticate_user!, only: [:index, :show]

    before_action :set_cook, only: [:show, :edit, :update, :destroy]

    before_action :set_dish_available, only: [:index]

    def index
      @cooks = []
      @places = []
      places = []
        if params[:location]
          nearby_places = Place.near(params[:location], 0.5)
          @dishes.each do |dish|
          places << dish.cook.places.active
          end
          places.flatten!
          @places = nearby_places & places
          @places.each do |place|
          @cooks << place.cooks
          @cooks.flatten!
          end
        else
          @dishes.each do |dish|
          @cooks << dish.cook
          @places << dish.cook.places.active
          end
          @places.flatten!
          @cooks.flatten!
        end

      @hash = Gmaps4rails.build_markers(@places) do |place, marker|
        marker.lat place.latitude
        marker.lng place.longitude
        marker.infowindow render_to_string(partial: "/cooks/map_box", locals: { place: place })
      end

    end

    def show
      @dishes = @cook.dishes.order(updated_at: :asc)

      @specialities = @cook.specialities
      @places = @cook.places

      #Orders received and users concerned
      # @orders_r = Order.all.each do |order|
      #   order.dishes.find_by(cook_id: @cook.id)
      #   @user = User.find_by(email: order.email)
      # end

      #Orders placed and cooks concerned
      # @orders_p = Order.all.where(email: @cook.user.email)
      # @orders_p.each do |order|
      #   order.dishes.each do |dish|
      #     @cook_p = dish.cook
      #   end
      # end

    end

    def new
      @cook = Cook.new

      @cook_places = @cook.cook_places.build
      @place = @cook_places.build_place

      @cook_specialities = @cook.cook_specialities.build
      @speciality = @cook_specialities.build_speciality
    end

    def create
      @cook = Cook.new(cook_params)
      @cook.user_id = current_user.id
      respond_to do |format|
        if @cook.save
          format.html { redirect_to cook_url(@cook), notice: "Votre profil a bien été créé" }
        else
          format.html { render :new }
        end
      end
    end

    def edit
    end

    def update
      @places = @cook.places
      if @cook.user == current_user
        if @cook.update(cook_params)
          redirect_to cook_url(@cook), notice: "Votre profil a bien été modifié"
        else
          render :edit
        end
      else
        flash[:alert] = "Action impossible, ce n'est pas votre profil !"
        render :edit
      end
    end

    def destroy
      if @cook.user == current_user
        @cook.destroy
        redirect_to cooks_url, notice: "Votre profil a bien été supprimé"
      else
        flash[:alert] = "Action impossible, ce n'est pas votre profil !"
        redirect_to cooks_url
      end
    end

    private

      def set_cook
        @cook = Cook.find(params[:id])
      end

      def set_dish_available
        @dishes = Dish.available
      end

      def cook_params
        params.require(:cook).permit( :user_id, :age, :bio, :avatar, :terms_of_service,
          cook_specialities_attributes: [:id, :speciality_id, :_destroy,
            speciality_attributes: [:id, :_destroy, :name, :level]],
          cook_places_attributes: [:id, :place_id, :_destroy,
            place_attributes: [:id, :_destroy, :full_address, :zip_code, :city, :kind_of_place, :comments, :active]])
      end

end
