Rails.application.routes.draw do

  # user
  resources :users
  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'

  # article
  resources :articles
  resources :authors, only: [:show] do
    resources :articles, only: [:index]
  end

  # author
  get '/authors', to: 'authors#author_index'
  get '/authors/articles', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'
end

get '/me', to: 'users#show'
get '/me', to: 'sessions#show'
post '/signup', to: 'users#create'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

resources :articles, only:[:index, :show] do
  resources :reviews, only:[:update, :create]
end
resources :reviews
end
