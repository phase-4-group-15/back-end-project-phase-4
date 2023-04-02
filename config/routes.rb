Rails.application.routes.draw do

  # user & author

  # get '/me/:id', to: 'users#show'
  post '/signup', to: 'sessions#create'
  post '/me', to: 'sessions#show'
  post '/login', to: 'users#login'
  delete '/logout', to: 'sessions#logout'
  get '/articles', to: 'sessions#index'
  get '/reviews', to: 'sessions#reviews'
  put 'reset/:id', to: 'sessions#reset_password'
  

  # article
  # resources :articles
  
  # resources :articles, only:[:index, :show] do
  #   resources :reviews, only:[:index, :update, :create]
  # end
  
  # resources :users, only: [:show] do
  #   resources :articles, only: [:index]
  # end

  # author
  # get '/authors', to: 'authors#author_index'
  # get '/authors/articles', to: 'authors#index'
  # get '/authors/articles/:id', to: 'authors#show'
  # post '/authors/signup', to: 'authors#create'
  # post '/authors/login', to: 'authors#login'
  # delete '/authors/logout', to: 'authors#logout'
 

  # reviews
  resources :reviews

end
