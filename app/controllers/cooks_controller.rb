class CooksController < ApplicationController

    skip_before_action :authenticate_user!, only: [:index, :show]

    before_action :set_cook, only: [:show, :edit, :update, :destroy]

    def index
      if params[:location]
        @cooks = []
        @places = Place.active.near(params[:location], 0.5)
        @places.each do |place|
          @cooks << place.cooks
        end
        @cooks.flatten!
      else
        @places = Place.active.all
        @cooks = Cook.order(created_at: :asc)
      end

      @hash = Gmaps4rails.build_markers(@places) do |place, marker|
        marker.lat place.latitude
        marker.lng place.longitude
        marker.infowindow render_to_string(partial: "/cooks/map_box", locals: { place: place })
      end

    end

    def show
      @dishes = @cook.dishes.order(updated_at: :desc)

      @specialities = @cook.specialities
      @places = @cook.places
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
      @cook.user = current_user
      if @cook.save
        redirect_to cook_path(@cook), notice: "Votre profil a bien été créé"
      else
        render :new
      end
    end

    def edit
    end

    def update
      @places = @cook.places
      if @cook.user == current_user
        @cook.update(cook_params)
        redirect_to cook_path(@cook), notice: "Votre profil a bien été modifié"
      else
        flash[:alert] = "Action impossible, ce n'est pas votre profil !"
        render :edit
      end
    end

    def destroy
      if @cook.user == current_user
        @cook.destroy
        redirect_to cooks_path, notice: "Votre profil a bien été supprimé"
      else
        flash[:alert] = "Action impossible, ce n'est pas votre profil !"
        redirect_to cooks_path
      end
    end

    private
    def set_cook
      @cook = Cook.find(params[:id])
    end

    def cook_params
      params.require(:cook).permit(:last_name, :first_name, :age, :bio, :avatar,
        cook_specialities_attributes: [:id, :_destroy,
          speciality_attributes: [:id, :name, :level]],
        cook_places_attributes: [:id, :place_id, :_destroy,
          place_attributes: [:id, :_destroy, :name, :full_address, :zip_code, :city, :kind_of_place, :active]])
    end

end
