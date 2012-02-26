Devchallengeonrails::Application.routes.draw do

  get '/history' => 'tweets#index'
  match '/:id' => 'users#show'
  
  resources :tweets
  resources :users

  root to: 'home#index'
end
