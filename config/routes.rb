Rails.application.routes.draw do
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :ingredients, only: [:index]

  root 'recipes#index'
end
