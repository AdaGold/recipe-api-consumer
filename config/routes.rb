Rails.application.routes.draw do
  root to: 'search#new'
  
  # Search routes

  # should return the list of search results
  get 'search/index'

  # should "show" a selected recipe from the list of search results'
  get 'search/show'


  # Results routes
  get 'results/index'

  # Recipe routes
  get 'recipe/show/:id' => 'recipe#show', as: 'recipe_show'

end
