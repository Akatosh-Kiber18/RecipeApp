require 'swagger_helper'

describe 'Recipes API' do

  path '/recipes' do

    get 'Retrieves a list of recipes' do
      tags 'Recipes'
      produces 'application/json'

      response '200', 'list of recipes' do
        run_test!
      end
    end

    post 'Creates a new recipe' do
      tags 'Recipes'
      consumes 'application/json'
      parameter name: :recipe, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          instructions: { type: :string }
        },
        required: [ 'title', 'instructions' ]
      }

      response '201', 'recipe created' do
        let(:recipe) { { title: 'New Recipe', instructions: 'Cook it well' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:recipe) { { title: 'Incomplete Recipe' } }
        run_test!
      end
    end
  end

  path '/recipes/{id}' do

    get 'Retrieves a recipe by ID' do
      tags 'Recipes'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'recipe found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 instructions: { type: :string }
               },
               required: [ 'id', 'title', 'instructions' ]

        let(:id) { Recipe.create(title: 'New Recipe', instructions: 'Cook it well').id }
        run_test!
      end

      response '404', 'recipe not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Deletes a recipe' do
      tags 'Recipes'
      parameter name: :id, in: :path, type: :string

      response '204', 'recipe deleted' do
        let(:recipe) { create(:recipe) }
        let(:id) { recipe.id }
        run_test!
      end

      response '404', 'recipe not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
