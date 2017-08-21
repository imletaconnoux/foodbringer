Rails.application.routes.draw do

	# will need to add "only" component to some resources

  resources :order_items
  resources :items
  resources :orders
  resources :addresses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
