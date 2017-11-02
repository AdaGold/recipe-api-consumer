Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#root'
  get '/recipes', to: 'recipes#index', as: 'search_recipe'
  #
  get 'recipes/:label', to: 'recipes#show', as: 'recipe'
end
