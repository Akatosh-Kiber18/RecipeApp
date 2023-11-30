Rails.application.routes.draw do
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :ingredients, only: [:index, :create, :new, :destroy]

  # get 'recipes/:id', action: :add_ingredients, controller: 'recipes'

  root 'recipes#index'
end
