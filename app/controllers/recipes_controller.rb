class RecipesController < ApplicationController
  before_action :set_collections, only: [:new, :create]

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(set_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:notice] = 'Não foi possível cadastrar a receita'
      render :new
    end
  end

  private

  def set_params
    params.require(:recipe).permit(:name, :cuisine_id, :food_type_id, :level,
                                   :directions, :cooking_time, :ingredients,
                                   :serves, :photo)
  end

  def set_collections
    @cuisines = Cuisine.all
    @food_types = FoodType.all
  end
end
