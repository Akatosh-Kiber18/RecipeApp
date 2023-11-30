class IngredientsController < ApplicationController
  before_action :set_recipe, only: [:create, :destroy]

  def new
    set_recipe
  end

  def create
    ingredient = {
      "name" => params[:name],
      "weight" => params[:weight],
      "recipe_id" => @recipe_id,
    }

    @ingredient = Ingredient.new(ingredient)
    if @ingredient.save
      # @recipe = Recipe.find_by(id: @recipe_id)
      puts "New ingredient saved"
      redirect_to recipe_path(@recipe)
    else
      puts "Saving failed"
      puts @ingredient.errors.full_messages.inspect
      render :new
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @recipe = Recipe.find_by(id: @ingredient.recipe_id)
    @ingredient.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe_id = params[:recipe_id]
    @recipe = Recipe.find_by(id: params[:recipe_id])
  end
end
