Bikemap::Application.routes.draw do
  resources :routes;

  root to: 'routes#index' 
end
