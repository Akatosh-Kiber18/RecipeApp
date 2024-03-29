class RecipesController < ApplicationController
  # while testing remove CSRF Protection
  # TODO REMOVE THIS AND FIGURE HOW IT WILL WORK WITH REACT
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
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
        format.all { head :not_acceptable }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
        format.all { head :not_acceptable }
      end
    end
  end

  def destroy
    if @recipe.destroy
      render json: { message: 'Recipe was successfully destroyed' }, status: :ok
    else
      render json: { error: 'Failed to destroy recipe' }, status: :unprocessable_entity
    end
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  def recipe_params
    params.require(:recipe).permit(:title, :instructions, :ingredients_data, ingredients_attributes: [:name, :weight])
  end
end
