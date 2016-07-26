class DishesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :load_cook

  before_action :load_dish, only: [:show, :edit, :update, :destroy]

  before_action :set_order_item, only: [:index, :show]


  def index
    @dishes = @cook.dishes.all
  end

  def new
    @dish = @cook.dishes.new
  end

  def show
  end

  def create
    @dish = @cook.dishes.new(dish_params)
    if @cook.user == current_user
      @dish.save
      redirect_to cook_dishes_path(@cook), notice: "Votre popote a bien été créée"
    else
      flash[:alert] = "Action impossible, ce n'est pas votre profil !"
      render :new
    end
  end

  def edit
  end

  def update
    if @cook.user == current_user
      @dish.update(dish_params)
      redirect_to cook_dishes_path(@cook,@dish), notice: "Votre popote a bien été mise à jour"
    else
      flash[:alert] = "Action impossible, ce n'est pas votre profil !"
      render :edit
    end
  end

  def destroy
    if @cook.user == current_user
      @dish.destroy
      redirect_to cook_dishes_path(@cook), notice: "Votre popote a bien été supprimée"
    else
      flash[:alert] = "Action impossible, ce n'est pas votre profil !"
      redirect_to cook_dishes_path(@cook)
    end
  end

  private

  def load_cook
    @cook = Cook.find(params[:cook_id])
  end

  def load_dish
    @dish = @cook.dishes.find(params[:id])
  end

  def set_order_item
    @order_item = current_order.order_items.new(dish: @dish)
  end

  def dish_params
    params.require(:dish).permit(:name, :kind_of_dish, :speciality, :description, :veggie, :cooked, :be_reheated, :portion_size, :portion_count, :price, photos: [])
  end
end
