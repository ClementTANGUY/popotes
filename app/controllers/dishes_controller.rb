class DishesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  # before_action :find_cook_dish, only: [:show, :edit, :update, :destroy]


  def index
    @cook = Cook.find(params[:cook_id])
    @dishes = @cook.dishes
  end

  def new
    @cook = Cook.find(params[:cook_id])
    @dish = @cook.dishes.build
  end

  def create
    @cook = Cook.find(params[:cook_id])
    @cook.user == current_user
    @dish = @cook.dishes.new(dish_params)
      if @dish.save
        redirect_to cook_dishes_path(@cook,@dish)
    else
      flash[:alert] = "Action impossible, ce n'est pas votre profil !"
      render :new
    end
  end

  def show
    @cook = Cook.find(params[:cook_id])
    @dish = @cook.dishes.find(params[:id])
  end

  def edit
    @cook = Cook.find(params[:cook_id])
    @dish = @cook.dishes.find(params[:id])
  end

  def update
    cook = Cook.find(params[:cook_id])
    @dish = @cook.dishes.find(params[:id])
    if @cook.user == current_user
      @dish.update(dish_params)
      redirect_to cook_dishes_path(@cook,@dish)
    else
      flash[:alert] = "Action impossible, ce n'est pas votre profil !"
      render :edit
    end
  end

  def destroy
    @cook = Cook.find(params[:cook_id])
    @dish = @cook.dishes.find(params[:id])
    @dish.destroy
    redirect_to cook_dishes_path(@cook,@dish)
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :kind_of_dish, :speciality, :description, :veggie, :cooked, :be_reheated, :portion_size, :portion_count)
  end
end
