Airports::Application.routes.draw do

  match '/signup' => 'users#new', :as => :signup
  resources :users

  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => 'flights#index'
  resources :flights
  # match '/flights' => 'flights#index', :as => :flights
  # match '/:id' => 'flights#show', :as => :flight
end