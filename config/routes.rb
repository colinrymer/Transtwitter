Devchallengeonrails::Application.routes.draw do

  get '/history'  => 'tweets#index', as: "history"
  get '/users'    => 'users#index',  as: "users"
  match '/:id'    => 'users#show'
  
  resources :tweets, :users

  root to: 'home#index'
end
