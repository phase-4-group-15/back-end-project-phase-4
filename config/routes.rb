Rails.application.routes.draw do

  # user
  resources :users

  get '/me/:id', to: 'users#show'
  get '/me/:id', to: 'sessions#show'
  post '/users/signup', to: 'users#create'
  post '/users/login', to: 'sessions#create'
  delete '/users/logout', to: 'sessions#destroy'

  # article
  resources :articles
  resources :authors, only: [:show, :index] do
    resources :articles, only: [:index]
  end
  # resources :users, only: [:show] do
  #   resources :articles, only: [:index]
  # end

  # author
  get '/authors', to: 'authors#author_index'
  get '/authors/articles', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'
  post '/authors/signup', to: 'authors#create'
  post '/authors/login', to: 'authors#login'

  resources :articles, only:[:index, :show] do
    resources :reviews, only:[:index, :update, :create]
  end

  # reviews
  resources :reviews

end
