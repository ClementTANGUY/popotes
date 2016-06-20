class CooksController < ApplicationController

    skip_before_action :authenticate_user!, only: [ :index, :show ]

    before_action :find_cook, only: [:show, :edit, :update, :destroy]

    def index
      @cooks = Cook.all
    end

    def new
      @cook = Cook.new
    end

    def show
    end

    def create
      @cook = Cook.new(cook_params)
      @cook.user = current_user
      if @cook.save
        redirect_to cooks_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @cook.user == current_user
        @cook.update(cook_params)
        redirect_to cooks_path
      else
        flash[:alert] = "Action impossible, ce n'est pas votre profil."
        render :edit
      end
    end

    def destroy
      if @cook.user == current_user
        @cook.destroy
        redirect_to cooks_path
      else
        flash[:alert] = "Action impossible, ce n'est pas votre profil."
        redirect_to cooks_path
      end
    end

    private
    def find_cook
      @cook = Cook.find(params[:id])
    end
    def cook_params
      params.require(:cook).permit(:last_name, :first_name, :age, :bio)
    end

end
