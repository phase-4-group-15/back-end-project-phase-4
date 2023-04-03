Rails.application.routes.draw do

  # user
  post '/signup', to: 'users#create'
  get '/me', to: "users#show"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  
# articles
  post '/articles', to: 'articles#create'
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show'
  put '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#destroy'
  post '/articles/:id/like', to: 'articles#like'
  post '/articles/:id/dislike', to: 'articles#dislike'
  
  # reviews
  get '/reviews', to: 'reviews#index'
  get '/reviews/:id', to: 'reviews#show'
  post '/reviews', to: 'reviews#create'
  patch '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy'

  # reset password
  patch '/reset/:username', to: 'users#reset_password'

  # verify auth
  get '/verify', to: 'application#verify_auth'

  # advertisement
  get '/advertisements', to: 'advertisements#index'
  get '/advertisements/:id', to: 'advertisements#show'

end
