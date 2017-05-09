Rails.application.routes.draw do
 root 'search#welcome', to:'search#welcome'

  get 'search', to: 'search#index', as:'searches'

  get 'searches/:item/', to: 'search#show', as: 'search'

  # post 'search/:query/send_search', to:'search#send_search', as:'send_search'

end
