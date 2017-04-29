class DishesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show]

  before_action :set_cook

  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @dish = @cook.dishes.new
  end

  def create
    @dish = @cook.dishes.new(dish_params)
    @cook.user == current_user
    if @dish.save
      redirect_to cook_url(@cook), notice: "Votre popote a bien été créée"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cook.user == current_user
      if @dish.update(dish_params)
        redirect_to cook_url(@cook), notice: "Votre popote a bien été mise à jour"
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
      @dish.destroy
      redirect_to cook_url(@cook), notice: "Votre popote a bien été supprimée"
    else
      flash[:alert] = "Action impossible, ce n'est pas votre profil !"
      redirect_to cook_url(@cook)
    end
  end

  private

  def set_cook
    @cook = Cook.find(params[:cook_id])
  end

  def set_dish
    @dish = @cook.dishes.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :kind_of_dish, :speciality,
                                :description, :veggie, :cooked,
                                :be_reheated, :gluten_free, :halal,
                                :kosher, :portion_size, :portion_count,
                                :price, :exp_date, :collect_date,
                                photos: [])
  end

end
