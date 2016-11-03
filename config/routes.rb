Rails.application.routes.draw do
  root to: 'search#new'

  # Recipe routes
  get 'recipe/new'

  get 'recipe/update'

  get 'recipe/show'

  get 'recipe/destroy'

  # Results routes
  get 'results/index'

  get 'results/new'

  get 'results/create'

  get 'results/show'

  get 'results/edit'

  get 'results/update'

  get 'results/destroy'

  # Search routes
  get 'search/new'

  get 'search/create'

  get 'search/update'

  get 'search/destroy'

  get 'search/show'

  
end
