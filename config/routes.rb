Rails.application.routes.draw do
  devise_for :users
  resources :foods, only: [:index, :show, :new, :create, :update, :destroy]
  # resources :recipes, only: [:index, :show, :new, :create, :update, :destroy], path: 'public_recipes' do
  #   put 'public', on: :member, to: 'recipes#public_allocation'
  # end
  resources :foods
  resources :recipes do
    resources :recipe_foods
  end
  resources :public_recipes
  post 'toggle_public', to: 'recipes#toggle'

  resources :recipe_foods, only: [:index], path: 'general_shopping_list'
end
