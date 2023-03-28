Rails.application.routes.draw do
  resources :users
  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'

  resources :articles
  resources :authors, only: [:show] do
    resources :articles, only: [:index]
  end
end