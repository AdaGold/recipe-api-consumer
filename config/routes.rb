Rails.application.routes.draw do
  root to: 'search#new'
  
  # Search routes

  # should return the list of search results
  get 'search/index'

  # should "show" a selected recipe from the list of search results'
  get 'search/show'

  #for a new search
  get 'search/new'

  get 'search/create'

  get 'search/update'

  get 'search/destroy'

  # Results routes
  get 'results/index'

  get 'results/new'

  get 'results/create'

  get 'results/show'

  get 'results/edit'

  get 'results/update'

  get 'results/destroy'

  # Recipe routes
  get 'recipe/new'

  get 'recipe/update'

  get 'recipe/show'

  get 'recipe/destroy'

end
