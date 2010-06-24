ActionController::Routing::Routes.draw do |map|
  
  map.devise_for :users
  
  map.root :controller => :dashboard, :only => :index
  
  map.resources :leagues
  map.resources :teams
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
