ActionController::Routing::Routes.draw do |map|
  
  map.devise_for :users
  
  map.root :controller => :dashboard, :only => :index
  
  map.matchup '/matchups', :controller => :leagues, :action => :matchups
  map.resources :leagues
  map.resources :teams
  map.resources :players
  map.resources :drafts
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
