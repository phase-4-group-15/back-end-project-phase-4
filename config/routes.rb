Rails.application.routes.draw do

  # user
  post '/signup', to: 'users#create'
  get '/me', to: "users#show"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  patch '/reset/:id', to: 'users#reset_password'
  

  # articles
  post '/articles', to: 'articles#create'
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show'
  put '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#destroy'
  post '/articles/:id/like', to: 'articles#like'
  post '/articles/:id/dislike', to: 'articles#dislike'
  

  # verify auth
  get '/verify', to: 'application#verify_auth'

  
  # advertisement
  get '/ad/:id', to: 'advertisements#show'


  # reviews
  resources :reviews

end
