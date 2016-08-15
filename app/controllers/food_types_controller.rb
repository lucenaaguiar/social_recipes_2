class FoodTypesController < ApplicationController
  def show
    @food_type = FoodType.find(params[:id])
  end

  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = FoodType.new(params.require(:food_type).permit(:name))
    if @food_type.save
      redirect_to @food_type
    else
      flash.now[:notice] = 'Não foi possível cadastrar tipo'
      render :new
    end
  end
end
