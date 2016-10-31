Rails.application.routes.draw do
  root "homepage#show"

  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1, defaults: {format: :json}  do
      post   "/links",       to: "links#create"
    end
  end
  
  resources :links, only: [:index]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
