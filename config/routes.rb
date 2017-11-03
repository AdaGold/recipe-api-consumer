Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#root'
  get '/recipes', to: 'recipes#index', as: 'search_recipe'
  get 'recipes/:label', to: 'recipes#show', as: 'recipe'
  get 'nutrition/:label', to: 'recipes#nutrition', as: 'nutrition'

  get "/auth/:provider/callback", to: "sessions#create", as: 'login'

  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]
  
end
