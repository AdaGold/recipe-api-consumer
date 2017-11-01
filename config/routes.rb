Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#root'
  # resources :recipes, only: [:index, :show]
  get '/recipes', to: 'recipes#index', as: 'search_recipe'
  #
  get 'recipes/:label', to: 'recipes#show', as: 'recipe'
end

# what should my routes be?
# search
# index
# show


# root 'recipes#index'
# get '/recipes', to: 'recipes#index', as: 'recipes'
# get '/recipes/:uri', to: 'recipes#show', as: 'recipe'
