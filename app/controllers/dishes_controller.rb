class DishesController < ApplicationController

  before_action :find_dish, only: [:show, :edit, :update, :destroy]

  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def show
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dishes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dish.update(dish_params)
      redirect_to dishes_path
    else
      render :edit
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishes_path
  end

  private
  def find_dish
    @dish = Dish.find(params[:id])
  end
  def dish_params
    params.require(:dish).permit(:name, :kind_of_dish, :speciality, :description, :veggie, :cooked, :be_reheated, :portion_size, :portion_count)
  end
end
