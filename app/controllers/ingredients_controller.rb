class IngredientsController < ApplicationController
  # while testing remove CSRF Protection
  # TODO REMOVE THIS AND FIGURE HOW IT WILL WORK WITH REACT
  skip_before_action :verify_authenticity_token
  before_action :set_recipe, only: [:create, :destroy]

  def new
    set_recipe
  end

  def create
    ingredient_params = {
      name: params[:name],
      weight: params[:weight],
      recipe_id: @recipe.id
    }

    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      render json: { message: 'Ingredient was successfully created', ingredient: @ingredient }, status: :created
    else
      render json: { error: 'Failed to create ingredient', errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.destroy
      render json: { message: 'Ingredient was successfully destroyed' }, status: :ok
    else
      render json: { error: 'Failed to destroy ingredient' }, status: :unprocessable_entity
    end
  end

  private

  def set_recipe
    @recipe_id = params[:recipe_id]
    @recipe = Recipe.find_by(id: params[:recipe_id])
  end
end
