Rails.application.routes.draw do

	# will need to add "only" component to some resources

  resources :order_items
  resources :items
  resources :orders
  resources :addresses
  resources :users

  patch '/orders/:id/delivered', to: 'orders#delivered', as: 'delivered'



  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  root to: 'application#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
