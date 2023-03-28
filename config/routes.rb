Rails.application.routes.draw do
  resources :articles
  resources :authors, only: [:show] do
    resources :articles, only: [:index]
  end
end
