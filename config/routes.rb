Rails.application.routes.draw do

  # user
  post '/signup', to: 'users#create'
  get '/me', to: "users#show"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  patch '/reset/:id', to: 'users#reset_password'
  
<<<<<<< HEAD

  # articles
=======
# articles
>>>>>>> Shukri-rails
  post '/articles', to: 'articles#create'
  get '/articles', to: 'articles#index'
  get '/articles/:id', to: 'articles#show'
  put '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#destroy'
  post '/articles/:id/like', to: 'articles#like'
  post '/articles/:id/dislike', to: 'articles#dislike'
  
<<<<<<< HEAD

  # verify auth
  get '/verify', to: 'application#verify_auth'

  # advertisement
  get '/ad/:id', to: 'advertisements#show'

  # author
  get '/authors', to: 'authors#author_index'
  get '/authors/articles', to: 'authors#index'
  get '/authors/articles/:id', to: 'authors#show'
  post '/authors/signup', to: 'authors#create'
  post '/authors/login', to: 'authors#login'
  delete '/authors/logout', to: 'authors#logout'

=======
>>>>>>> Shukri-rails
  # reviews
  get '/reviews', to: 'reviews#index'
get '/reviews/:id', to: 'reviews#show'
post '/reviews', to: 'reviews#create'
patch '/reviews/:id', to: 'reviews#update'
delete '/reviews/:id', to: 'reviews#destroy'

# reset password
patch '/reset/:username', to: 'users#reset_password'

# advertisement
get '/advertisement', to: 'advertisements#index'
post '/advertisement', to: 'advertisements#create'


end
