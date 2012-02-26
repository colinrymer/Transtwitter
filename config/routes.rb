Devchallengeonrails::Application.routes.draw do

  get '/history'  => 'tweets#index'
  get '/users'    => 'users#index'
  match '/:id'    => 'users#show'
  
  resources :tweets, :users

  root to: 'home#index'
end
