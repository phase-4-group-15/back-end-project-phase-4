Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'
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
