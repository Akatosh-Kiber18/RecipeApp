class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :destroy]
    def index
      @recipes = Recipe.all
    end

    def show
      @recipe = Recipe.find(params[:id])
    end

    def new
      @recipe = Recipe.new
      @form_id = 'new_recipe_form'
    end

    def create
      recipe ={
        "title" => params[:recipe][:title],
        "instructions" => params[:recipe][:instructions],
      }

      @recipe = Recipe.new(recipe)

      puts 'PARAMS', params
      if params[:recipe][:ingredients_data].present?
        ingredients_data = JSON.parse(params[:recipe][:ingredients_data])

        ingredients_data.each do |ingredient_data|
          @recipe.ingredients.build(ingredient_data)
        end
      end

      if @recipe.save
        redirect_to @recipe, notice: 'Recipe was successfully created.'
      else
        render :new
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
