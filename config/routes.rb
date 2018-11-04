Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#home'
  # root 'recipes#new'

  # can be homepage not attached to controller or must be controller
  # get 'recipes/search', to: , as: 'search'
  # get 'recipes/new', to: 'recipes#new', as: 'search'

  # get 'recipes/index', to: 'recipes#index', as: 'index'
  # get 'recipe', to: 'recipes#show', as: 'show'

  resources :recipes
end


# :recipes/new
# :recipes/index
