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
    params.require(:recipe).permit(:name, :cuisine_id, :food_type, :directions,
                                   :level, :cooking_time, :ingredients, :serves)
  end

  def set_collections
    @cuisines = Cuisine.all
  end
end
