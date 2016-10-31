Rails.application.routes.draw do
  root "homepage#show"

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
