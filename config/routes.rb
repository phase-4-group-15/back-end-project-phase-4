Rails.application.routes.draw do

  # user
  resources :users
  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'

  # article
  resources :articles
  # resources :authors, only: [:show] do
  #   resources :articles, only: [:index]
  # end

  # author
  get '/authors/:id', to: 'authors#index'
end