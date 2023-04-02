Rails.application.routes.draw do

  # user
  post '/signup', to: 'users#create'
  get '/me', to: "users#show"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  

  post '/articles', to: 'articles#create'
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show'
  put '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#destroy'
  post '/articles/:id/like', to: 'articles#like'
  post '/articles/:id/dislike', to: 'articles#dislike'
  
  patch '/reset/:id', to: 'users#reset_password'

  # verify auth
  get '/verify', to: 'application#verify_auth'


  # get '/me/:id', to: 'users#show'
  # post '/users/signup', to: 'users#create'
  # post '/users/login', to: 'sessions#create'
  # delete '/users/logout', to: 'sessions#destroy'
  # get '/users/articles', to: 'users#index'
  # get '/users/reviews', to: 'users#reviews'
  

  # article
  # resources :articles
  
  # resources :articles, only:[:index, :show] do
  #   resources :reviews, only:[:index, :update, :create]
  # end
  
  # resources :users, only: [:show] do
  #   resources :articles, only: [:index]
  # end

  # author
  get '/authors', to: 'authors#author_index'
  get '/authors/articles', to: 'authors#index'
  get '/authors/articles/:id', to: 'authors#show'
  post '/authors/signup', to: 'authors#create'
  post '/authors/login', to: 'authors#login'
  delete '/authors/logout', to: 'authors#logout'
 

  # reviews
  resources :reviews

end
