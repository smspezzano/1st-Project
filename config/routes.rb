Bikemap::Application.routes.draw do
  resources :routes, :users, :sessions;

  root to: 'routes#index' 

  get '/signup' => 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  get'/signin' => 'sessions#new'
end
