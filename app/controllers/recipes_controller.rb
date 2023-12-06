class RecipesController < ApplicationController
  # while testing remove CSRF Protection
  skip_before_action :verify_authenticity_token
  before_action :set_recipe, only: [:show, :destroy]
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    render json: @recipe
  end

  def new
    @recipe = Recipe.new
  end

  def add_ingredients
   @recipe = Recipe.find(params[:id])
  end

  def create
    # "Content-Type" header, in this case, "application/json,"
    recipe_params = params.require(:recipe).permit(:title, :instructions)
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.json { render :show, status: :created, location: @recipe }
      else
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully destroyed.'
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  def recipe_params
    params.require(:recipe).permit(:title, :instructions, :ingredients_data, ingredients_attributes: [:name, :weight])
  end
end
