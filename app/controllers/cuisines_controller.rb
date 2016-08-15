class CuisinesController < ApplicationController
  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(params.require(:cuisine).permit(:name))
    if @cuisine.save
      redirect_to @cuisine
    else
      flash.now[:notice] = 'Não foi possível cadastrar cozinha'
      render :new
    end
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end
end
