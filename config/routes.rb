Rails.application.routes.draw do

	# will need to add "only" component to some resources

  resources :order_items
  resources :items
  resources :orders
  resources :addresses
  resources :users

  # order status adjustment routes
  # chef order actions
  patch '/orders/:id/accepted', to: 'orders#accepted', as: 'accepted'
  patch '/orders/:id/ready', to: 'orders#ready', as: 'ready'
  # courier order actions
  patch '/orders/:id/picked_up', to: 'orders#picked_up', as: 'picked_up'
  patch '/orders/:id/delivered', to: 'orders#delivered', as: 'delivered'


  # session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  # root route
  root to: 'application#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
